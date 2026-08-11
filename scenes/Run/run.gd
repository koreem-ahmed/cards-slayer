extends Node


class_name Run

const BATTLE_SCENE := preload("res://scenes/Battle/battle.tscn")
const BATTLE_REWARDS_SCENE := preload("res://scenes/Battle Reawards/battle_rewards.tscn")
const CAMPFIRE_SCENE := preload("res://scenes/Campfire/campfire.tscn")
const MAP_SCENE := preload("res://scenes/Map/map.tscn")
const SHOP_SCENE := preload("res://scenes/Shop/shop.tscn")
const TREASURE_SCENE := preload("res://scenes/Treasure/treasure.tscn")

@export var run_startup: RunStartup

@onready var current_view: Node = $"Current view"
@onready var map_btn: Button = %"Map btn"
@onready var battle_btn: Button = %"battle btn"
@onready var shop_btn: Button = %"shop btn"
@onready var treature_btn: Button = %"treature btn"
@onready var rewards_btn: Button = %"rewards btn"
@onready var campfire_btn: Button = %"campfire btn"

var character: CharacterStats


func _ready() -> void:
	if not run_startup:
		return
	
	match run_startup.type:
		RunStartup.Type.NEW_RUN:
			character = run_startup.picked_char.create_instance()
			start_run()
		RunStartup.Type.CONTINUED_RUN:
			print("TODO: loade previous run")


func start_run() -> void:
	setup_event_connections()
	print("TODO: generate map")
	

func change_view(scene: PackedScene) -> void:
	if current_view.get_child_count() > 0:
		current_view.get_child(0).queue_free()
	
	get_tree().paused = false
	var new_view := scene.instantiate()
	current_view.add_child(new_view)


func setup_event_connections() -> void:
	Events.battle_won.connect(change_view.bind(BATTLE_REWARDS_SCENE))
	Events.battle_reward_exited.connect(change_view.bind(MAP_SCENE))
	Events.campfire_exited.connect(change_view.bind(MAP_SCENE))
	Events.map_exited.connect(on_map_exited)
	Events.shop_exited.connect(change_view.bind(MAP_SCENE))
	Events.treasure_room_exited.connect(change_view.bind(MAP_SCENE))
	
	battle_btn.pressed.connect(change_view.bind(BATTLE_SCENE))
	campfire_btn.pressed.connect(change_view.bind(CAMPFIRE_SCENE))
	map_btn.pressed.connect(change_view.bind(MAP_SCENE))
	rewards_btn.pressed.connect(change_view.bind(BATTLE_REWARDS_SCENE))
	shop_btn.pressed.connect(change_view.bind(SHOP_SCENE))
	treature_btn.pressed.connect(change_view.bind(TREASURE_SCENE))


func on_map_exited() -> void:
	print("TODO: from Map, change view based no room type")
