extends Area2D


class_name MapRoom

signal selected(room: Room)

const ICONS := {
	Room.Type.NOT_ASSIGNED: [null, Vector2.ONE],
	Room.Type.MONSTER: [preload("res://assets/tile_0103.png"), Vector2.ONE],
	Room.Type.TREASURE: [preload("res://assets/tile_0089.png"), Vector2.ONE],
	Room.Type.CAMPFIRE: [preload("res://assets/custom/New icons card game-2.png (1).png"), Vector2(0.6, 0.6)],
	Room.Type.SHOP: [preload("res://assets/custom/shop_icon.png"), Vector2(0.6, 0.6)],
	Room.Type.BOSS: [preload("res://assets/custom/final_boss_icon.png"), Vector2(1.25, 1.25)]
}

@onready var cross: TextureRect = $Visuals/cross
@onready var sprite_2d: Sprite2D = $Visuals/Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var available := false :set = set_available
var room: Room : set = set_room


func _ready() -> void:
	var test_room := Room.new()
	test_room.type = Room.Type.CAMPFIRE
	test_room.position = Vector2(100, 100)
	room = test_room


func set_available(new_value: bool) -> void:
	available = new_value
	
	if available:
		animation_player.play("highlight")
	elif not room.selected:
		animation_player.play("RESET")


func set_room(new_data: Room) -> void:
	room = new_data
	position = room.position
	sprite_2d.texture = ICONS[room.type][0]
	sprite_2d.scale = ICONS[room.type][1]


func show_selected() -> void:
	cross.modulate = Color.WHITE


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if not available or not event.is_action_pressed("left_mouse"):
		return
	
	room.selected = true
	animation_player.play("select")


# called when animation "select" finishes
func on_map_room_selected() -> void:
	selected.emit(room)
