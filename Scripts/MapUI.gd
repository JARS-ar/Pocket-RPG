extends CanvasLayer


var selected_location
const ACTIONS_OFFSET = Vector2(0, 22)
const DESCRIPTIONS_OFFSET = Vector2(0, 55)
onready var player = get_parent().find_node('PlayerToken')



func set_location(new_location):
	if new_location == null:
		selected_location = null
		$Tween.interpolate_property(self, 'offset', offset, DESCRIPTIONS_OFFSET, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		$Tween.start()
	if new_location == selected_location:
		return
	selected_location = new_location
	set_actions(selected_location)
	set_description(selected_location.description)

func update_actions():
	if selected_location.rect_position == player.global_position:
		if selected_location.can_enter:
			$ActionsPanel/ActionsContainer/ActionButton.text = 'Entrar'
			$ActionsPanel/ActionsContainer/ActionButton.disabled = false
			$ActionsPanel/ActionsContainer/ActionButton2.text = 'Viajar'
			$ActionsPanel/ActionsContainer/ActionButton2.disabled = true
			$Tween.interpolate_property(self, 'offset', offset, Vector2(), 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Tween.start()
		else:
			$ActionsPanel/ActionsContainer/ActionButton.text = ''
			$ActionsPanel/ActionsContainer/ActionButton.disabled = true
			$Tween.interpolate_property(self, 'offset', offset, ACTIONS_OFFSET, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Tween.start()
	else:

		$ActionsPanel/ActionsContainer/ActionButton.text = 'Entrar'
		$ActionsPanel/ActionsContainer/ActionButton.disabled = true
		$ActionsPanel/ActionsContainer/ActionButton2.text = 'Viajar'
		$ActionsPanel/ActionsContainer/ActionButton2.disabled = false
		$Tween.interpolate_property(self, 'offset', offset, Vector2(), 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		$Tween.start()

func set_actions(location):
	
	if location.rect_position == player.global_position:
		if location.can_enter:
			$ActionsPanel/ActionsContainer/ActionButton.text = 'Entrar'
			$ActionsPanel/ActionsContainer/ActionButton.disabled = false
			$ActionsPanel/ActionsContainer/ActionButton2.text = 'Viajar'
			$ActionsPanel/ActionsContainer/ActionButton2.disabled = true
			$Tween.interpolate_property(self, 'offset', offset, Vector2(), 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Tween.start()
		else:
			$ActionsPanel/ActionsContainer/ActionButton.text = ''
			$ActionsPanel/ActionsContainer/ActionButton.disabled = true
			$Tween.interpolate_property(self, 'offset', offset, ACTIONS_OFFSET, 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Tween.start()
	else:

		$ActionsPanel/ActionsContainer/ActionButton.text = 'Entrar'
		$ActionsPanel/ActionsContainer/ActionButton.disabled = true
		$ActionsPanel/ActionsContainer/ActionButton2.text = 'Viajar'
		$ActionsPanel/ActionsContainer/ActionButton2.disabled = false
		$Tween.interpolate_property(self, 'offset', offset, Vector2(), 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		$Tween.start()

func set_description(description):
	$DescriptionPanel/RichText.text = description

func _on_ActionButton_pressed():

	if selected_location != null:
		selected_location.enter_location()


func _on_ActionButton2_pressed():
	$Tween.remove_all()
	var nav = get_parent().find_node('Navigator')
	nav.travel_to(selected_location)





func _on_InventoryButton_pressed():

	get_parent().pause_mode = !get_parent().pause_mode
	$Menu/Inventory.visible = !$Menu/Inventory.visible
