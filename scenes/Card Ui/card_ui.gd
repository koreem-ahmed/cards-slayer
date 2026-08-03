extends Control

class_name CardUi

signal reparent_requested(card_ui: CardUi)

const BASE_STYLEBOX := preload("res://assets/themes/card_base_stylebox.tres")
const DRAG_STYLEBOX := preload("res://assets/themes/card_dragging_stylebox.tres")
const HOVER_STYLEBOX := preload("res://assets/themes/card_hover_stylebox.tres")

@export var card: Card : set = set_card

@onready var panel: Panel = $Panel
@onready var cost: Label = $Cost
@onready var icon: TextureRect = $Icon
@onready var drop_detector: Area2D = $drop_detector
@onready var card_state_machine: CardStateMachine = $card_state_machine as CardStateMachine
@onready var targets: Array[Node] = []

var parent: Control
var tween: Tween


func _ready() -> void:
	card_state_machine.init(self)


func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)


func animate_to_position(new_position: Vector2, duration: float) -> void:
	tween = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", new_position, duration)


func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)


func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()


func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()


func set_card(value: Card) -> void:
	if not is_node_ready():
		await ready
	
	card = value
	cost.text = str(card.cost)
	icon.texture = card.icon
	


func _on_drop_detector_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)
	

func _on_drop_detector_area_exited(area: Area2D) -> void:
	targets.erase(area)
	
