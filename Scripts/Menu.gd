extends CanvasLayer


var selected_tab = null

func _ready():
	select_tab($Display/Bio)
	$Display.hide()
	


func _on_MenuButton_pressed():
	var tree = get_tree()
	tree.paused = !tree.paused	
	$Display.visible = !$Display.visible

func select_tab(tab):
	if tab == selected_tab:
		return
	if selected_tab != null:
		selected_tab.hide()
	selected_tab = tab
	selected_tab.show()


func _on_BioButton_pressed():
	select_tab($Display/Bio)




func _on_InventoryButton_pressed():
	select_tab($Display/Inventory)
