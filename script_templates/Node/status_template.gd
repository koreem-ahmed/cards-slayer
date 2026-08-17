# meta-name: Status
# meta-description: Create an status that applyes to a targett

extends Status


class_name MyNewStatus

var number_var := 0

func initialize_status(_target: Node) -> void:
	print("Initialize my status for the target")


func apply_status(_target: Node) -> void:
	print("my status targets")
	print("it deos somting")
	
	status_applied.emit(self)
