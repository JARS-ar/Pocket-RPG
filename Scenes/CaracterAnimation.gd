extends Node2D

func move_right():
	$Sprite/AnimationPlayer.play("FastWalk")


func move_left():
	$Sprite/AnimationPlayer.play_backwards("FastWalk")


func _on_AnimationPlayer_animation_finished(anim_name):
	$Sprite/AnimationPlayer.play("Iddle")
