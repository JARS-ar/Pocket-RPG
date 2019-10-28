extends Node2D

signal arrived_at_destination



func move_along_path(path):
#	print(path)
	for move in path.size()-1:

		if move == path.size()-1:
			$Tween.interpolate_property(self, 'position', path[move], path[move+1], 0.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		else:
			$Tween.interpolate_property(self, 'position', path[move], path[move+1], 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
		yield($Tween,"tween_all_completed")
	
	emit_signal("arrived_at_destination")


