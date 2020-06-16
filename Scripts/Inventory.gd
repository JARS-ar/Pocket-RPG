extends Control;

const HOVER_OFFSET = Vector2(-16,-16)
var slotList = Array();
var itemList = Array();

var holdingItem = null;


func _input(event):
	if event is InputEventAction:
		return
	if holdingItem != null && holdingItem.picked:
		holdingItem.rect_global_position = Vector2(event.position.x, event.position.y) + HOVER_OFFSET;

func on_pressed_ItemSlot(slot):
	if holdingItem == null:
		if slot.item == null:
			return;
		else:
			$VBoxContainer/DescriptionPannel/DescriptionLabel.text = slot.item.name
	else :
		if slot.item == null:
			slot.putItem(holdingItem)
			holdingItem = null
		else:
			var movingItem = holdingItem
			holdingItem = slot.pickItem()
			slot.putItem(movingItem)
			$HoverLayer.add_child(holdingItem)
			holdingItem.rect_global_position = get_global_mouse_position() + HOVER_OFFSET

func on_long_pressed_ItemSlot(slot):

	if holdingItem == null:
		if slot.item == null:

			return;
		else:
			holdingItem = slot.pickItem()
			$HoverLayer.add_child(holdingItem)
			holdingItem.rect_global_position = get_global_mouse_position() + HOVER_OFFSET
