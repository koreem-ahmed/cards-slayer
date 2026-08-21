extends Card

const POISON_ICON := preload("res://assets/tile_0114.png")

var poison_stacks := 4


class PoisonStatus:
	extends Status

	func get_tooltip() -> String:
		return tooltip % stacks

	func apply_status(target: Node) -> void:
		if stacks > 0 and is_instance_valid(target):
			target.take_damage(stacks, Modifier.Type.DMG_TAKEN)
			stacks -= 1

		status_applied.emit(self)


func get_default_toolttip() -> String:
	return tool_tip_text % poison_stacks


func get_updated_tooltip(_player_modifiers: ModifierHandler, _enemy_modifiers: ModifierHandler) -> String:
	return tool_tip_text % poison_stacks


func apply_effects(targets: Array[Node], _modifiers: ModifierHandler) -> void:
	var poison := PoisonStatus.new()
	poison.id = "poison"
	poison.type = Status.Type.START_OF_TURN
	poison.stack_type = Status.StackType.INTENSITY
	poison.stacks = poison_stacks
	poison.icon = POISON_ICON
	poison.tooltip = "Poison: takes %s damage at the start of the turn, then loses 1 Poison."

	var status_effect := StatusEffect.new()
	status_effect.status = poison
	status_effect.execute(targets)
	SFXPlayer.play(sound)
