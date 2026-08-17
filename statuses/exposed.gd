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
		exposed_modifier_value.percent_value = MODIFIER
		dmg_taken_modifier.add_new_value(exposed_modifier_value)
	
	if not status_changed.is_connected(on_status_chaged):
		status_changed.connect(on_status_chaged.bind(dmg_taken_modifier))


func on_status_chaged(dmg_taken_modifier: Modifier) -> void:
	if duration <= 0 and dmg_taken_modifier:
		dmg_taken_modifier.remove_value("exposed")
