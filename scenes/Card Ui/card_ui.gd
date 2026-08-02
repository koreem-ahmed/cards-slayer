extends Control

class_name CardUi

signal reparent_requested(card_ui: CardUi)


@onready var color_rect: ColorRect = $ColorRect
@onready var state: Label = $State
@onready var drop_detector: Area2D = $drop_detector
@onready var card_state_machine: CardStateMachine = $card_state_machine as CardStateMachine
@onready var targets: Array[Node] = []


func _ready() -> void:
	card_state_machine.init(self)


func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()


func _on_drop_detector_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)
	

func _on_drop_detector_area_exited(area: Area2D) -> void:
	targets.erase(area)
	
