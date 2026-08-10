extends Control

@onready var continue_btn: Button = %"Continue btn"


func _ready() -> void:
	get_tree().paused = false


func _on_continue_pressed() -> void:
	pass


func _on_new_run_pressed() -> void:
	pass


func _on_exit_pressed() -> void:
	get_tree().quit()
