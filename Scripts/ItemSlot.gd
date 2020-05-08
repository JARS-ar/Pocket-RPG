extends TextureRect

export var slotIndex:String ;
var item = null;

signal pressed(slot)
signal long_pressed(slot)

var pressed_timer: Timer

func _ready():
	pressed_timer = Timer.new()
	self.add_child(pressed_timer)
	pressed_timer.one_shot = true
	pressed_timer.connect("timeout", self, 'on_pressed_timer_timeout')

func on_pressed_timer_timeout():

	emit_signal("long_pressed", self)

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

func can_equip():
	pass

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			if pressed_timer.is_stopped():
				pressed_timer.start()

		else:
			if !pressed_timer.is_stopped():
				pressed_timer.stop()
			emit_signal("pressed", self)
