extends Control

const ASSASSIN_STATS = preload("res://characters/Assassin/assassin.tres")
const MAGE_STATS = preload("res://characters/Mage/mage.tres")
const WARRIOR_STATS = preload("res://characters/warrior/warrior.tres")

@onready var title: Label = %Title
@onready var description: Label = %Description
@onready var char_photo: TextureRect = %"Char photo"

var current_char: CharacterStats : set = set_current_char


func _ready() -> void:
	set_current_char(WARRIOR_STATS)


func set_current_char(new_char: CharacterStats) -> void:
	current_char = new_char
	title.text = current_char.char_name
	description.text = current_char.description
	char_photo.texture = current_char.photo
	



func _on_start_btn_pressed() -> void:
	pass


func _on_warrior_btn_pressed() -> void:
	current_char = WARRIOR_STATS


func _on_mage_btn_pressed() -> void:
	current_char = MAGE_STATS


func _on_assassin_btn_pressed() -> void:
	current_char = ASSASSIN_STATS
