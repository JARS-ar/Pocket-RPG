extends CanvasLayer







func _on_MenuButton_pressed():
	var tree = get_tree()
	tree.paused = !tree.paused
	$ColorRect.visible = !$ColorRect.visible 
	$Inventory.visible = !$Inventory.visible
