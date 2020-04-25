extends "res://Scripts/ItemSlot.gd"


func _ready():
	connect("pressed", get_parent(), "on_pressed_ItemSlot")

