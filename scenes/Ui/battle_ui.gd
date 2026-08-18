extends CanvasLayer


class_name BattleUI

@export var char_stats: CharacterStats : set = set_char_stats

@onready var hand: Hand = $Hand
@onready var mana_ui: ManaUI = $ManaUI
@onready var end_turn_btn: Button = %"End Turn btn"
@onready var draw_pile_btn: CardPileOpener = %"Draw Pile btn"
@onready var discard_pile_btn: CardPileOpener = %"Discard Pile btn"
@onready var draw_pile_view: CardPileView = %"Draw Pile View"
@onready var discard_pile_view: CardPileView = %"Discard Pile View"


func _ready() -> void:
	Events.player_hand_drawn.connect(on_player_hand_drawn)
	end_turn_btn.pressed.connect(on_player_turn_ended)
	draw_pile_btn.pressed.connect(draw_pile_view.show_current_view.bind("Draw Pile", true))
	discard_pile_btn.pressed.connect(discard_pile_view.show_current_view.bind("Discard Pile"))


func initialize_card_pile_ui() -> void:
	draw_pile_btn.card_pile = char_stats.draw_pile
	draw_pile_view.card_pile = char_stats.draw_pile
	discard_pile_btn.card_pile = char_stats.discard
	discard_pile_view.card_pile = char_stats.discard


func set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	mana_ui.char_stats = char_stats
	hand.char_stats = char_stats


func on_player_hand_drawn() -> void:
	end_turn_btn.disabled = false


func on_player_turn_ended() -> void:
	end_turn_btn.disabled = true
	Events.player_turn_ended.emit()
