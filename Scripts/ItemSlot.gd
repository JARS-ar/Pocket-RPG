extends TextureRect

export var slotIndex:String ;
var item = null;


func setItem(newItem):
	add_child(newItem);
	item = newItem;
	item.itemSlot = self;
	pass;
	
func pickItem():
	item.pickItem();
	remove_child(item);
	get_parent().get_parent().get_parent().add_child(item);
	item = null;

func putItem(newItem):
	item = newItem;
	item.itemSlot = self;
	item.putItem();
	get_parent().get_parent().get_parent().remove_child(item);
	add_child(item);
	pass;
