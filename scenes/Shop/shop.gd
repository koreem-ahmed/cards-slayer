extends Control


class_name Shop

const SHOP_CARD = preload("res://scenes/Shop/shop_card.tscn")
const SHOP_RELIC = preload("res://scenes/Shop/shop_relic.tscn")

@export var shop_relics: Array[Relic]
@export var char_stats: CharacterStats
@export var run_stats: RunStats
@export var relic_handler: RelicHandler

@onready var cards: HBoxContainer = %Cards
@onready var relics: HBoxContainer = %Relics
@onready var card_tip_popup: CardTipPopup = %"Card Tip Popup"
@onready var blinking_animation: AnimationPlayer = %"Blinking Animation"
@onready var blink_timer: Timer = %"Blink Timer"
@onready var modifier_handler: ModifierHandler = $"Modifier Handler"


func _ready() -> void:
	for shop_card: ShopCard in cards.get_children():
		shop_card.queue_free()
	
	for shop_relic: ShopRelic in relics.get_children():
		shop_relic.queue_free()
	
	Events.shop_card_bought.connect(on_shop_card_bought)
	Events.shop_relic_bought.connect(on_shop_relic_bought)
	
	blink_timer_setup()
	blink_timer.timeout.connect(on_blink_timer_timout)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and card_tip_popup.visible:
		card_tip_popup.hide_tooltip()


func populate_shop() -> void:
	generate_shop_cards()
	generate_shop_relics()


func blink_timer_setup() -> void:
	blink_timer.wait_time = randf_range(1.0, 5.0)
	blink_timer.start()


func generate_shop_cards() -> void:
	var shop_card_array: Array[Card] = []
	var available_cards := char_stats.draftable_cards.duplicate(true)
	available_cards.shuffle()
	shop_card_array = available_cards.cards.slice(0, 3)
	
	for card: Card in shop_card_array:
		var new_shop_card := SHOP_CARD.instantiate() as ShopCard
		cards.add_child(new_shop_card)
		new_shop_card.card = card
		new_shop_card.current_card_ui.tooltip_requested.connect(card_tip_popup.show_tooltip)
		new_shop_card.gold_cost = get_updated_shop_cost(new_shop_card.gold_cost)
		new_shop_card.update(run_stats)


func generate_shop_relics() -> void:
	var shop_relics_array: Array[Relic] = []
	var available_relics := shop_relics.filter(
		func(relic: Relic):
			var can_appear := relic.can_appear_as_reward(char_stats)
			var already_had_it := relic_handler.has_relic(relic.id)
			return can_appear and not already_had_it
	)
	
	available_relics.shuffle()
	shop_relics_array = available_relics.slice(0, 3)
	
	for relic: Relic in shop_relics_array:
		var new_shop_relic := SHOP_RELIC.instantiate() as ShopRelic
		relics.add_child(new_shop_relic)
		new_shop_relic.relic = relic
		new_shop_relic.gold_cost = get_updated_shop_cost(new_shop_relic.gold_cost)
		new_shop_relic.update(run_stats)


func get_updated_shop_cost(original_cost: int) -> int:
	return modifier_handler.get_modified_value(original_cost, Modifier.Type.SHOP_COST)


func update_item() -> void:
	for shop_card: ShopCard in cards.get_children():
		shop_card.update(run_stats)
	
	for shop_relic: ShopRelic in relics.get_children():
		shop_relic.update(run_stats)


func update_item_costs() -> void:
	for shop_card: ShopCard in cards.get_children():
		shop_card.gold_cost = get_updated_shop_cost(shop_card.gold_cost)
		shop_card.update(run_stats)
	
	for shop_relic: ShopRelic in relics.get_children():
		shop_relic.gold_cost = get_updated_shop_cost(shop_relic.gold_cost)
		shop_relic.update(run_stats)



func _on_back_btn_pressed() -> void:
	Events.shop_exited.emit()


func on_shop_card_bought(card: Card, gold_cost: int) -> void:
	char_stats.deck.add_card(card)
	run_stats.gold -= gold_cost
	update_item()


func on_shop_relic_bought(relic: Relic, gold_cost: int) -> void:
	relic_handler.add_relic(relic)
	run_stats.gold -= gold_cost
	
	if relic is CouponsRelic:
		var coupon_relic := relic as CouponsRelic
		coupon_relic.add_shop_modifier(self)
		update_item_costs()
	else:
		update_item()


func on_blink_timer_timout() -> void:
	blinking_animation.play("blink")
	blink_timer_setup()
