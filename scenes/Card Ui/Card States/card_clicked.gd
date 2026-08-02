extends CardState


func enter() -> void:
	card_ui.color_rect.color = Color.ORANGE
	card_ui.state.text = "CLICKED"
	card_ui.drop_detector.monitoring = true 
	


func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		state_transition.emit(self, CardState.State.DRAGGING)
