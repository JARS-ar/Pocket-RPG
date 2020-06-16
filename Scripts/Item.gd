class_name Item extends Node

var id: String
var equiped: bool = false

var itemSlot;
var picked = false;

func _init(itemName: String, itemTexture: Texture, itemSlot, itemValue: int, itemMods := []):
	return null

static func create_item():
	pass




class Weapon extends Item:
	var damage
