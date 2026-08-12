extends Panel

class_name ManaUI


@export var char_stats: CharacterStats : set = set_char_stats

@onready var mana_label: Label = $Mana_Label

func _ready() -> void:
	await get_tree().create_timer(2).timeout
	char_stats.mana = 3

func set_char_stats(value: CharacterStats) -> void:
	char_stats = value
	
	if not char_stats.stats_changed.is_connected(on_state_changed):
		char_stats.stats_changed.connect(on_state_changed)
	
	if not is_node_ready():
		await ready
	
	on_state_changed()


func on_state_changed() -> void:
	mana_label.text = "%s/%s" % [char_stats.mana, char_stats.max_mana] 
