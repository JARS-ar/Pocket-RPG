extends Button

export var description = 'Description'
export var scene: PackedScene
export var can_enter = false

onready var camera = get_tree().current_scene.find_node('MapCamera')
var ui = null


func _on_Location_selected():

	
	camera.move(self.rect_global_position)
	if ui == null:
		ui = get_tree().current_scene.find_node('UI')
	ui.set_location(self)



func enter_location():

	if scene:
		var tree = get_tree()
		var transition = tree.current_scene.find_node('TransitionColor')
		transition.close()
		yield(transition,'animation_finished')
		tree.change_scene_to(scene)
	
	
	
	
	
	
	
	
	
	
