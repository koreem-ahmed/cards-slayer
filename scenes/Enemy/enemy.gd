extends Area2D


class_name Enemy

const ARROW_OFFSET := 5

@export var stats: Stats : set = set_enemy_stats

@onready var enemy_sprite: Sprite2D = $"enemy sprite"
@onready var arrow: Sprite2D = $arrow
@onready var stats_ui: StatsUI = $StatsUI


func _ready() -> void:
	await get_tree().create_timer(2).timeout
	take_damage(10)
	print(stats.health)


func set_enemy_stats(value: Stats) -> void:
	stats = value.create_instance()
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)
	
	update_enemy()


func update_stats() -> void:
	print(stats)
	stats_ui.update_stats(stats)



func update_enemy() -> void:
	if not stats is Stats:
		return
	if not is_inside_tree():
		await ready
	
	enemy_sprite.texture = stats.art
	arrow.position = Vector2.RIGHT * (enemy_sprite.get_rect().size.x / 2 + ARROW_OFFSET)
	update_stats()
	


func take_damage(damage: int) -> void:
	if stats.health <= 0:
		return
	stats.take_damage(damage)
	
	if stats.health <= 0 :
		queue_free()
