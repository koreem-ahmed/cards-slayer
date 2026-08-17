extends Status


class_name ExposedStatus

const MODIFIER := 0.5


func initialize_status(target: Node) -> void:
	assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	
	var dmg_taken_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.DMG_TAKEN)
	assert(dmg_taken_modifier, "No dmg taken modifier on %s" % target)
	
	var exposed_modifier_value := dmg_taken_modifier.get_value("exposed")
	
	if not exposed_modifier_value:
		exposed_modifier_value = ModifierValue.create_new_modifier("exposed", ModifierValue.Type.PRECENT_BASED)
		exposed_modifier_value.precent_value = MODIFIER
	
