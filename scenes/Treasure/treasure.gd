extends Control


func _on_back_btn_pressed() -> void:
	Events.treasure_room_exited.emit()
