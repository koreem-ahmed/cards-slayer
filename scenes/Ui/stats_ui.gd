extends HBoxContainer


class_name  StatsUI

@onready var block_label: Label = %block_label
@onready var health_label: Label = %health_label
@onready var block: HBoxContainer = $Block
@onready var health: HBoxContainer = $Health


func update_stats(stats: Stats) -> void:
	block_label.text = str(stats.block)
	health_label.text = str(stats.health)
	
	block.visible = stats.block > 0
	health.visible = stats.health > 0
