extends ColorRect


class_name CardRewards

signal card_reward_selected(card: Card)

const CARD_MENU_UI = preload("res://scenes/Ui/card_menu_ui.tscn")

@export var rewards: Array[Card] : set = set_rewards

@onready var cards: HBoxContainer = %Cards
@onready var skip_card_reward_btn: Button = %"Skip Card Reward btn"
@onready var card_tip_popup: CardTipPopup = $"Card Tip Popup"
@onready var take_btn: Button = $"Card Tip Popup/Take btn"

var selected_card: Card


func _ready() -> void:
	clear_rewards()
	
	take_btn.pressed.connect(
		func():
			card_reward_selected.emit(selected_card)
			queue_free()
	)
	
	skip_card_reward_btn.pressed.connect(
		func():
			card_reward_selected.emit(null)
			queue_free()
	)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		card_tip_popup.hide_tooltip()


func clear_rewards() -> void:
	for card: Node in cards.get_children():
		card.queue_free()
	
	card_tip_popup.hide_tooltip()
	
	selected_card = null


func show_tooltip(card: Card) -> void:
	selected_card = card
	card_tip_popup.show_tooltip(card)


func set_rewards(new_cards: Array[Card]) -> void:
	rewards = new_cards
	
	if not is_node_ready():
		await ready
	
	clear_rewards()
	
	for card: Card in rewards:
		var new_card := CARD_MENU_UI.instantiate() as CardMenuUi
		cards.add_child(new_card)
		new_card.card = card
		new_card.tooltip_requested.connect(show_tooltip)
