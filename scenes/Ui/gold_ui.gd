extends HBoxContainer


class_name GoldUI

@export var run_stats: RunStats : set = set_run_stats

@onready var label: Label = $Label


func _ready() -> void:
	label.text = "0"


func set_run_stats(new_value: RunStats) -> void:
	run_stats = new_value
	
	if not run_stats.gold_changed.is_connected(update_gold):
		run_stats.gold_changed.connect(update_gold)
		update_gold()


func update_gold() -> void:
	label.text = str(run_stats.gold)
