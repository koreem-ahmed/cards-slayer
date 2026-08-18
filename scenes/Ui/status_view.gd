extends Control


class_name StatusView

const STATUS_TOOLTIP = preload("res://scenes/Ui/status_tooltip.tscn")

@onready var status_tooltiips: VBoxContainer = %"Status Tooltiips"


func _ready() -> void:
	for tooltip: StatusTooltip in status_tooltiips.get_children():
		tooltip.queue_free()
	
	Events.status_tooltip_requested.connect(show_view)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and visible:
		hide_view()


func show_view(statuses: Array[Status]) -> void:
	for status: Status in statuses:
		var new_status_tooptip := STATUS_TOOLTIP.instantiate() as StatusTooltip
		status_tooltiips.add_child(new_status_tooptip)
		new_status_tooptip.status = status
	
	show()


func hide_view() -> void:
	for tooltip: StatusTooltip in status_tooltiips.get_children():
		tooltip.queue_free()
	
	hide()


func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse") and visible:
		hide_view()


func _on_back_btn_pressed() -> void:
	hide_view()
