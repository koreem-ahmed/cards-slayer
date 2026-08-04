extends PanelContainer


class_name Tooltip

@export var fade_secs := 0.2

@onready var tooltip_icon: TextureRect = %Tooltip_icon
@onready var toolipt_label: RichTextLabel = %Tooltip_label

var tween: Tween


func _ready() -> void:
	Events.card_tooltip_requested.connect(show_tooltip)
	Events.tooltip_hide_requested.connect(hide_tooltip)
	modulate = Color.TRANSPARENT
	hide()


func show_tooltip(icon:  Texture, text: String) -> void:
	if tween:
		tween.kill()
	
	tooltip_icon.texture = icon
	toolipt_label.text = text
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(show)
	tween.tween_property(self, "modulate", Color.WHITE, fade_secs)


func hide_tooltip() -> void:
	if tween:
		tween.kill()
	
	hide_animation()


func hide_animation() -> void:
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, fade_secs)
	tween.tween_callback(hide)
	
