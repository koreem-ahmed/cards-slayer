# meta-name: Effect
# meta-description: Create an effect that applyes to a target

extends Effect


class_name MyNewEffect

var number_var := 0


func execute(_targets: Array[Node]) -> void:
	print("This is a new effect")
