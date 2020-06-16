extends TextureRect

var itemIcon;

var itemSlot;
var picked = false;

func _init(itemName: String, itemTexture: Texture, itemSlot, itemValue: int, itemMods := []):
	name = itemName;
#	self.itemName = itemName;
	texture = itemTexture;
	hint_tooltip = "Name: %s\n\nValue: %d" % [itemName, itemValue];
	self.itemSlot = itemSlot;
	mouse_filter = Control.MOUSE_FILTER_PASS;
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND;

func pickItem():
	mouse_filter = Control.MOUSE_FILTER_IGNORE;
	picked = true;
	pass

func putItem():
	rect_position = Vector2(0, 0);
	mouse_filter = Control.MOUSE_FILTER_PASS;
	picked = false;
	pass
