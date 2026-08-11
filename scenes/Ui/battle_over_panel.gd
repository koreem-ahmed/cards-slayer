extends Panel


class_name BattleOverPanel

enum Type {WIN, LOSE}


@onready var label: Label = %Label
@onready var continue_btn: Button = %"Continue btn"
@onready var restart_btn: Button = %"Restart btn"


func _ready() -> void:
	Events.battle_over_screen_requested.connect(show_screen)


func show_screen(text: String, type: Type) -> void:
	label.text = text
	continue_btn.visible = type == Type.WIN
	restart_btn.visible = type == Type.LOSE
	get_parent().visible = true
	show()
	get_tree().paused = true


func _on_continue_btn_pressed() -> void:
	Events.battle_won.emit()


func _on_restart_btn_pressed() -> void:
	get_tree().reload_current_scene()
