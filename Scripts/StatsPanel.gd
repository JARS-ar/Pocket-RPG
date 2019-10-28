extends Panel



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_hp_changed(value):
	$StatsContainer/HPLabel.text = 'HP\n' + str(value)


func _on_Player_ap_changed(value):
	$StatsContainer/APLabel.text = 'AP\n' + str(value)


func _on_Player_mp_changed(value):
	$StatsContainer/MPLabel.text = 'MP\n' + str(value)
