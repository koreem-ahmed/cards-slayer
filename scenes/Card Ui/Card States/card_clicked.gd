extends CardState


func enter() -> void:
	card_ui.drop_detector.monitoring = true 
	


func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		state_transition.emit(self, CardState.State.DRAGGING)
