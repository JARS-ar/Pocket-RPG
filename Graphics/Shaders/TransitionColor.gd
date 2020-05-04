extends ColorRect
signal animation_finished
onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func close():
	animation_player.play("close")

func open():
	animation_player.play('open')

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name:
		emit_signal("animation_finished")
