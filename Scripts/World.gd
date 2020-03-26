extends Node


func _ready():
	$Transitions/TransitionColor.open()
	$Navigator.create_roads()



func _on_UI_pause_world():
	get_tree().paused = !get_tree().paused
	
	if $Navigator.mouse_filter == Control.MOUSE_FILTER_IGNORE:
		$Navigator.mouse_filter = Control.MOUSE_FILTER_STOP
	else:
		$Navigator.mouse_filter = Control.MOUSE_FILTER_IGNORE
