extends "res://Scripts/ItemSlot.gd"

func _init(slotIndex):
	self.slotIndex = slotIndex;
	name = "ItemSlot_%d" % slotIndex
	texture = preload("res://Graphics/Sprites/skil.png");
	
	mouse_filter = Control.MOUSE_FILTER_PASS;
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND;
	pass

func _ready():
	var error = connect("pressed", get_parent().get_parent().get_parent(), "on_pressed_ItemSlot")
	if error != OK:
		print (error, " en ", self.name)
	error = connect("long_pressed", get_parent().get_parent().get_parent(), "on_long_pressed_ItemSlot")
	if error != OK:
		print (error, " en ", self.name)
