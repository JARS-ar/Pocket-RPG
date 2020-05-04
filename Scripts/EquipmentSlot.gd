extends "res://Scripts/ItemSlot.gd"


func _ready():
	var error = connect("pressed", get_parent(), "on_pressed_ItemSlot")
	if error != OK:
		print (error, " en ", self.name)
