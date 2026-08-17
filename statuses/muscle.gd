extends Status


class_name MuscleStatus


func initialize_status(_target: Node) -> void:
	status_changed.connect(on_status_changed)
	on_status_changed


func on_status_changed() -> void:
	print("muscle statuse: +%s damage" % stacks)
