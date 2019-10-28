extends Node

onready var player = $Player
var enemy
onready var buttons = $GUI/ButtonsContainer

const Slash = preload("res://Scenes/Slash.tscn")

func _ready():
	$TransitionColor.open()
	start_player_turn()

func start_enemy_turn():
	if enemy:
		enemy.attack(player)
		yield(enemy, 'end_turn')
	start_player_turn()

func start_player_turn():
	player.update_stats()
	buttons.show()
	player.ap = player.max_ap
	yield(player, 'end_turn')
	buttons.hide()
	start_enemy_turn()


func hide_actions():
	$GUI/ButtonsContainer.visible = false

func show_actions():
	$GUI/ButtonsContainer.visible = true



func _on_Enemy_died():
	enemy = null




