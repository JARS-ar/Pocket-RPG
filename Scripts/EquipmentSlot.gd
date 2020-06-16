extends "res://Scripts/ItemSlot.gd"



func _ready():
	var error = connect("pressed", get_parent(), "on_pressed_ItemSlot")
	if error != OK:
		print (error, " en ", self.name)
	error = connect("long_pressed", get_parent(), "on_long_pressed_ItemSlot")
	if error != OK:
		print (error, " en ", self.name)
	can_equip()

static func can_equip():
	ItemSlot.can_equip()

