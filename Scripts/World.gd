extends Node


func _ready():
	$Transitions/TransitionColor.open()
	$Navigator.create_roads()

