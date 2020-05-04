
extends GridContainer;
const ItemClass = preload("res://Scripts/Item.gd");
const ItemSlotClass = preload("res://Scripts/InventorySlot.gd");

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
	
	for i in range(10):
		var slot = ItemSlotClass.new(i);
		slotList.append(slot);
		add_child(slot);
	
	slotList[0].setItem(itemList[0]);
	slotList[1].setItem(itemList[1]);
	slotList[2].setItem(itemList[2]);
	
	pass
