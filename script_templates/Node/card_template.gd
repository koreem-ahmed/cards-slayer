# meta-name: Card Logic
# meta-description: What happens when the card is played

extends Card

@export var optional_sound: AudioStream


func get_default_toolttip() -> String:
	return tool_tip_text


func get_updated_tooltip(_player_modifiers: ModifierHandler, _enemy_modifiers: ModifierHandler) -> String:
	return tool_tip_text


func apply_effects(_targets: Array[Node], _modifiers: ModifierHandler) -> void:
	print("make the main funciton here")
