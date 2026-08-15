extends HBoxContainer


class_name HealthUI

@export var show_max_hp: bool

@onready var health_label: Label = %health_label
@onready var max_health_label: Label = %"Max Health label"


func update_stats(stats: Stats) -> void:
	health_label.text = str(stats.health)
	max_health_label.text = "/%s" % str(stats.max_health)
	max_health_label.visible = show_max_hp
