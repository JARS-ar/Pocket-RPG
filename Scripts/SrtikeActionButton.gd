extends "res://Scripts/ActionButton.gd"

const Slash = preload("res://Scenes/Slash.tscn")

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = get_tree().current_scene.enemy
	if enemy:
		main.hide_actions()
		var slash = create_slash(enemy.global_position)
		yield(slash,'tree_exited')
		var player = main.find_node('Player')
		if player:
			player.attack(enemy, 4)
	

func create_slash(position):
	var slash = Slash.instance()
	var main = get_tree().current_scene
	main.add_child(slash)
	slash.global_position = position
	return slash