extends Control


class_name RelicTooltip

@onready var relic_icon: TextureRect = %"Relic Icon"
@onready var relic_tooltip: RichTextLabel = %"Relic Tooltip"
@onready var back_btn: Button = %"Back Btn"


func _ready() -> void:
	back_btn.pressed.connect(hide)
	hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and visible:
		hide()


func show_tooltip(relic: Relic) ->  void:
	relic_icon.texture = relic.icon
	relic_tooltip.text = relic.get_tooltip()
	show()


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		hide()
