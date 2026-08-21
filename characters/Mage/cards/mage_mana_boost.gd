extends Card

var mana_gain := 2


func get_default_toolttip() -> String:
	return tool_tip_text % mana_gain


func get_updated_tooltip(_player_modifiers: ModifierHandler, _enemy_modifiers: ModifierHandler) -> String:
	return tool_tip_text % mana_gain


func apply_effects(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	for target in targets:
		if target is Player:
			target.stats.mana += mana_gain
			SFXPlayer.play(sound)
