extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func hide_actions():
	$ButtonsContainer.visible = false

func show_actions():
	$ButtonsContainer.visible = true

func toggle_actions():
	$ButtonsContainer.visible = !$ButtonsContainer.visible