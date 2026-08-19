extends VBoxContainer


class_name ShopCard

const CARD_MENU_UI =  preload("res://scenes/Ui/card_menu_ui.tscn")

@export var card: Card : set = set_card

@onready var card_container: CenterContainer = %"Card Container"
@onready var price: HBoxContainer = %Price
@onready var price_label: Label = %"Price Label"
@onready var buy_btn: Button = %"Buy btn"
@onready var gold_cost := randi_range(100, 300)

var current_card_ui: CardMenuUi


func _ready() -> void:
	update(preload("res://test_data/test_run_stats.tres"))


func update(run_stats: RunStats) -> void:
	if not card_container or not price or not buy_btn:
		return
	
	price_label.text = str(gold_cost)
	
	if run_stats.gold >= gold_cost:
		price_label.remove_theme_color_override("font_color")
		buy_btn.disabled = false
	else:
		price_label.add_theme_color_override("font_color", Color.RED)
		buy_btn.disabled = true


func set_card(new_card: Card) -> void:
	if not is_node_ready():
		await ready
	
	card = new_card
	
	for card_menu_ui: CardMenuUi in card_container.get_children():
		card_menu_ui.queue_free()
	
	var new_card_menu_ui := CARD_MENU_UI.instantiate() as CardMenuUi
	card_container.add_child(new_card_menu_ui)
	new_card_menu_ui.card = card
	current_card_ui = new_card_menu_ui


func _on_buy_btn_pressed() -> void:
	Events.shop_card_bought.emit(card, gold_cost)
	card_container.queue_free()
	price.queue_free()
	buy_btn.queue_free()
