# meta-name: Card Logic
# meta-description: What happens when the card is played

extends Card

@export var optional_sound: AudioStream

func apply_effects(_targets: Array[Node], _modifiers: ModifierHandler) -> void:
	print("make the main funciton here")
