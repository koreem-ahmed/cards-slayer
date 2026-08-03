extends CardState

var played: bool

func enter() -> void:
	
	played = false
	
	if not card_ui.targets.is_empty():
		played = true
		print("play card for targets", card_ui.targets)



func on_input(event: InputEvent) -> void:
	if played:
		return
	
	state_transition.emit(self, CardState.State.BASE)
	
