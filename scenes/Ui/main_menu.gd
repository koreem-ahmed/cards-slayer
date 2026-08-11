extends Control

const CHAR_SELECTOR_SCENE = preload("res://scenes/Ui/char_selector.tscn")

@onready var continue_btn: Button = %"Continue btn"


func _ready() -> void:
	get_tree().paused = false


func _on_continue_pressed() -> void:
	pass


func _on_new_run_pressed() -> void:
	get_tree().change_scene_to_packed(CHAR_SELECTOR_SCENE)


func _on_exit_pressed() -> void:
	get_tree().quit()
