extends Control


func _on_back_btn_pressed() -> void:
	Events.campfire_exited.emit()
