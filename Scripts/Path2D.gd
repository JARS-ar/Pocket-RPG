extends Path2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const speed = 50
signal arrived_at_destination
var moving = false


func move_along_path(path):
	curve.clear_points()
	for point in path:

		curve.add_point(Vector2(point.x, point.y)*16)
	$PathFollow2D.unit_offset= 0.0
	moving = true


