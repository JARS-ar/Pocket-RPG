extends CanvasLayer


var selected_tab = null

func _ready():
	select_tab($Display/Slider/HBoxContainer/Bio)
	$Display.hide()
	


func _on_MenuButton_pressed():
	var tree = get_tree()
	tree.paused = !tree.paused	
	$Display.visible = !$Display.visible

func select_tab(tab):
	if tab == selected_tab:
		return
	if tab.name =='Bio':
		$Display/Slider/AnimationPlayer.play("InvToBio")
		$Display/CharacterAnimation.move_left()
	else:
		$Display/Slider/AnimationPlayer.play("BioToInv")
		$Display/CharacterAnimation.move_right()
	selected_tab = tab
	


func _on_BioButton_pressed():
	select_tab($Display/Slider/HBoxContainer/Bio)




func _on_InventoryButton_pressed():
	select_tab($Display/Slider/HBoxContainer/Inventory)
