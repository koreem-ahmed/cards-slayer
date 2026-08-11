extends Control


func _on_back_btn_pressed() -> void:
	Events.battle_reward_exited.emit()
