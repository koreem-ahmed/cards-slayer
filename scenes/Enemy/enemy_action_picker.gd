extends Node


class_name EbemyActionPicker

@export var enemy: Enemy: set = set_enemy
@export var target: Node2D: set = set_target

@onready var total_weight := 0.0


func _ready() -> void:
	
