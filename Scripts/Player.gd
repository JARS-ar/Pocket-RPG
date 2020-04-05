extends Node

const RED = Color(1, 0, 0, 1)
const WHITE = Color(1, 1, 1, 1)


var max_hp = 75
var max_mp = 75
var max_ap = 3
var hp = max_hp setget set_hp
var mp = max_mp setget set_mp
var ap = max_ap setget set_ap


signal hp_changed(value)
signal mp_changed(value)
signal ap_changed(value)
signal end_turn
#signal done

func set_hp(value):
	var last_value = hp
	
	hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed", hp)
	if last_value > hp:
		$Sprite.self_modulate = RED
		$AnimationPlayer.play("animations")
		yield($AnimationPlayer, "animation_finished")
		$Sprite.self_modulate = Color(1, 1, 1, 1)

func set_mp(value):
	mp = clamp(value, 0, max_mp)
	emit_signal("mp_changed", mp)

func set_ap(value):
	ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed", ap)

func attack(target, dmg, mp_cost = 0):
	var battle = get_parent()
	self.ap -= 1
	self.mp -= mp_cost
	target.take_damage(dmg)
	yield(target, 'done')
	battle.show_actions()
	if ap == 0:
		emit_signal('end_turn')

func update_stats():
	self.hp = hp
	self.mp = mp
	self.ap = ap
