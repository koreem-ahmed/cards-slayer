extends CanvasLayer


class_name PauseMenu

signal save_and_quit

@onready var back_to_game_btn: Button = %"Back to game  btn"
@onready var save_and_quit_btn: Button = %"Save and Quit btn"


func _ready() -> void:
	back_to_game_btn.pressed.connect(unpause)
	save_and_quit_btn.pressed.connect(on_save_btn_pressed)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if visible:
			unpause()
		else:
			pause()
		
		get_viewport().set_input_as_handled()

func pause() -> void:
	show()
	get_tree().paused = true


func unpause() -> void:
	hide()
	get_tree().paused = false


func on_save_btn_pressed() -> void:
	get_tree().paused = false
	save_and_quit.emit()
