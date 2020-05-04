extends Node2D

const RED = Color(1, 0, 0, 1)
const WHITE = Color(1, 1, 1, 1)



export var max_hp = 25
var hp = max_hp setget set_hp

export var attack_damage = 10
var current_target
onready var label = $HpLabel
onready var anim_player = $AnimationPlayer

signal died
signal end_turn
signal done

func _ready():
	var battle = get_tree().current_scene
	var error = connect("died", battle, '_on_Enemy_died')
	if error != OK:
		print (error, " en ", self.name)
	battle.enemy = self


func is_dead():
	return hp<=0

func set_hp(new_hp):
	hp = clamp(new_hp, 0, max_hp)
	label.text = str(hp) + ' HP'

func attack(target):
	current_target = target
	yield(get_tree().create_timer(0.4), "timeout")
	anim_player.queue("Attack")
	yield(anim_player, "animation_finished")
	current_target = null
	emit_signal('end_turn')

func deal_damage():
	current_target.hp -= attack_damage

func take_damage(amount):
	self.hp -= amount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
			$Sprite.self_modulate = RED
			anim_player.play("Shake Color")
			yield(anim_player, "animation_finished")
			$Sprite.self_modulate = Color(1, 1, 1, 1)
	emit_signal("done")
