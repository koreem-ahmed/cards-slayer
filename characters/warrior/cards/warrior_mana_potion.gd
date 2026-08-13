extends Card

@export var optional_sound: AudioStream

func apply_effects(_targets: Array[Node]) -> void:
	print("gain 2 mana")
