extends Control


class_name WinScreen

const MAIN_MENU = "res://scenes/Ui/main_menu.tscn"
const MESSAGE := "The %s\nis victorious!"

@export var character: CharacterStats : set = set_character

@onready var char_photo: TextureRect = %"Char photo"
@onready var message: Label = %Message


func set_character(new_char: CharacterStats) -> void:
	character = new_char
	message.text = MESSAGE % character.char_name
	char_photo.texture = character.portrait


func _on_main_menu_btn_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU)
