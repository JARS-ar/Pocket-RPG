extends "res://Scripts/ActionButton.gd"

const Swoosh = preload("res://Scenes/Swoosh.tscn")

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = get_tree().current_scene.enemy
	if enemy:
		main.hide_actions()
		var swoosh = create_slash(enemy.global_position)
		yield(swoosh,'tree_exited')
		var player = main.find_node('Player')
		if player:
			player.attack(enemy, 4)


func create_slash(position):
	var swoosh = Swoosh.instance()
	var main = get_tree().current_scene
	main.add_child(swoosh)
	swoosh.global_position = position
	return swoosh