extends TextureRect

export var slotIndex:String ;
var item = null;

signal pressed(slot)

func setItem(newItem):
	add_child(newItem);
	item = newItem;
	item.itemSlot = self;
	pass;
	
func pickItem():
	
	item.pickItem();
	var movingItem = item
	remove_child(movingItem)
	item = null
	return movingItem

func putItem(newItem):
	item = newItem;
	item.itemSlot = self;
	item.putItem();
	item.get_parent().remove_child(item);
	add_child(item);
	pass;

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		emit_signal("pressed", self)
		print(self.name)
