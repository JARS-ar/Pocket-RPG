extends "res://Scripts/ActionButton.gd"

const Spell = preload("res://Scenes/Spell.tscn")

func _on_pressed():
	
	var main = get_tree().current_scene
	var enemy = get_tree().current_scene.enemy
	if enemy:
		var player = main.find_node('Player')
		if player.mp >= 2:
			main.hide_actions()
			var spell = create_slash(enemy.global_position)
			yield(spell,'tree_exited')
			player.attack(enemy, 4, 2)


func create_slash(position):
	var spell = Spell.instance()
	var main = get_tree().current_scene
	main.add_child(spell)
	spell.global_position = position
	return spell