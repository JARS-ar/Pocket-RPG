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
	print(get_parent().get_parent().get_parent().get_child(0).name)
	get_parent().get_parent().get_parent().get_child(0).add_child(item);
	item = null;

func putItem(newItem):
	item = newItem;
	item.itemSlot = self;
	item.putItem();
	get_parent().get_parent().get_parent().get_child(0).remove_child(item);
	add_child(item);
	pass;
