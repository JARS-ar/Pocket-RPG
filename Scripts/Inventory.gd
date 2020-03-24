
extends GridContainer;
const ItemClass = preload("Item.gd");
const ItemSlotClass = preload("res://Scripts/ItemSlot.gd");

const slotTexture = preload("res://Graphics/Sprites/skil.png");
const itemImages = [
	preload("res://Graphics/Sprites/Ac_Ring05.png"),
	preload("res://Graphics/Sprites/A_Armor05.png"),
	preload("res://Graphics/Sprites/A_Armour02.png"),
	preload("res://Graphics/Sprites/A_Shoes03.png"),
	preload("res://Graphics/Sprites/C_Elm03.png"),
	preload("res://Graphics/Sprites/E_Wood02.png"),
	preload("res://Graphics/Sprites/P_Red02.png"),
	preload("res://Graphics/Sprites/W_Sword001.png")
];

const itemDictionary = {
	0: {
		"itemName": "Ring",
		"itemValue": 456,
		"itemIcon": itemImages[0]
	},
	1: {
		"itemName": "Sword",
		"itemValue": 100,
		"itemIcon": itemImages[7]
	},
	2: {
		"itemName": "Iron Ring",
		"itemValue": 987,
		"itemIcon": itemImages[0]
	},
};

var slotList = Array();
var itemList = Array();

var holdingItem = null;

func _ready():
	for item in itemDictionary:
		var itemName = itemDictionary[item].itemName;
		var itemIcon = itemDictionary[item].itemIcon;
		var itemValue = itemDictionary[item].itemValue;
		itemList.append(ItemClass.new(itemName, itemIcon, null, itemValue));
	
	for i in range(20):
		var slot = ItemSlotClass.new(i);
		slotList.append(slot);
		add_child(slot);
	
	slotList[0].setItem(itemList[0]);
	slotList[1].setItem(itemList[1]);
	slotList[2].setItem(itemList[2]);
	
	pass

func _input(event):
	if event is InputEventAction:
		return
	if holdingItem != null && holdingItem.picked:
		holdingItem.rect_global_position = Vector2(event.position.x, event.position.y);

func _gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var clickedSlot;
		for slot in slotList:
			var slotMousePos = slot.get_local_mouse_position();
			var slotTexture = slot.texture;
			var isClicked = slotMousePos.x >= 0 && slotMousePos.x <= slotTexture.get_width() && slotMousePos.y >= 0 && slotMousePos.y <= slotTexture.get_height();
			if isClicked:
				clickedSlot = slot;
		
		if holdingItem == null and clickedSlot == null:
			return;
		
		if clickedSlot == null:
			return;
			
		if holdingItem != null and clickedSlot != null:
			if clickedSlot.item != null:
				var tempItem = clickedSlot.item;
				var oldSlot = slotList[slotList.find(holdingItem.itemSlot)];
				clickedSlot.pickItem();
				clickedSlot.putItem(holdingItem);
				holdingItem = null;
				oldSlot.putItem(tempItem);
			else:
				clickedSlot.putItem(holdingItem);
				holdingItem = null;
		elif clickedSlot.item != null:
			holdingItem = clickedSlot.item;
			clickedSlot.pickItem();
			
			holdingItem.rect_global_position = Vector2(event.global_position.x, event.global_position.y);
	pass
