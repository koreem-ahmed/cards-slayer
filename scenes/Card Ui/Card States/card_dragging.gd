extends CardState

const DRAG_MINIMUM_TIME := 0.05

var min_time_elapaed := false

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		card_ui.reparent(ui_layer)
	
	card_ui.color_rect.color = Color.NAVY_BLUE
	card_ui.state.text = "DRAGGING"
	
	min_time_elapaed = false
	var hold_timer := get_tree().create_timer(DRAG_MINIMUM_TIME, false)
	hold_timer.timeout.connect(func(): min_time_elapaed = true)
	
	

func on_input(event: InputEvent) -> void:
	var single_targeted := card_ui.card.is_single_targeted()
	var mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")
	
	if single_targeted and mouse_motion and card_ui.targets.size() > 0:
		state_transition.emit(self, CardState.State.AIMING)
		print("aiming")
		return
	
	
	if mouse_motion:
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
	
	
	if cancel:
		state_transition.emit(self, CardState.State.BASE)
	elif min_time_elapaed and confirm:
		get_viewport().set_input_as_handled()
		state_transition.emit(self, CardState.State.RELEASED)
	
	
