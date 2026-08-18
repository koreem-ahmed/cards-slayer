extends Control


class_name RelicsControl

const RELICS_PER_PAGE := 5
const TWEEN_SCROLL_DURATION := 0.2

@export var left_btn: TextureButton
@export var right_btn: TextureButton

@onready var relics: HBoxContainer = %Relics
@onready var page_width = self.custom_minimum_size.x

var num_of_relics := 0
var current_page := 1
var max_page := 0
var tween: Tween


func _ready() -> void:
	left_btn.pressed.connect(on_left_btn_pressed)
	right_btn.pressed.connect(on_right_btn_pressed)
	
	for child: RelicUI in relics.get_children():
		child.free()
	
	relics.child_order_changed.connect(on_relics_child_order_changed)


func update() -> void:
	if not is_instance_valid(left_btn) or not is_instance_valid(right_btn):
		return
	
	num_of_relics = relics.get_child_count()
	max_page = ceili(num_of_relics / float(RELICS_PER_PAGE))
	
	left_btn.disabled = current_page <= 1
	right_btn.disabled = current_page >= max_page


func tween_to(x_position: float) ->  void:
	if tween:
		tween.kill()
	
	tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(relics, "position:x", x_position, TWEEN_SCROLL_DURATION)


func on_left_btn_pressed() -> void:
	if current_page > 1:
		current_page -= 1
		update()
		tween_to(relics.position.x + page_width)




func on_right_btn_pressed() -> void:
	if current_page < max_page:
		current_page += 1
		update()
		tween_to(relics.position.x - page_width)



func on_relics_child_order_changed():
	update()
