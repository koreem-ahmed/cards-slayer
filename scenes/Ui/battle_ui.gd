extends CanvasLayer


class_name BattleUI

@export var char_stats: CharacterStats : set = set_char_stats

@onready var hand: Hand = $Hand as Hand
@onready var mana_ui: ManaUI = $ManaUI as ManaUI
@onready var end_turn_btn: Button = %"End Turn btn"


func _ready() -> void:
	Events.player_hand_draw.connect(on_player_hand_draw)
	end_turn_btn.pressed.connect(on_player_turn_ended)


func set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	mana_ui.char_stats = char_stats
	hand.char_stats = char_stats


func on_player_hand_draw() -> void:
	end_turn_btn.disabled = false


func on_player_turn_ended() -> void:
	end_turn_btn.disabled = true
	Events.player_turn_ended.emit()
