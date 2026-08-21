extends Control


class_name Campfire

@export var char_stats: CharacterStats

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var character: TextureRect = $"UI Layer/character"


func _ready() -> void:
	character.texture = char_stats.photo


func _on_rest_btn_pressed() -> void:
	char_stats.heal(ceili(char_stats.max_health * 0.3))
	animation_player.play("fade_out")


func on_fade_out_finished() -> void:
	Events.campfire_exited.emit()
