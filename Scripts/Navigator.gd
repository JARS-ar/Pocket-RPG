extends Control

var astar = AStar.new()
var points_dic = {}
var roads_map
onready var map_camera: Camera2D = get_tree().current_scene.find_node('MapCamera')
onready var user_interface = get_parent().find_node('UI')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func create_roads():
	roads_map = get_parent().find_node('Roads')
	points_dic.clear()
	add_points()
	connect_points()


func add_points():
	
	var tiles = roads_map.get_used_cells()
	for cell in tiles:
		var index =  calculate_point_index(cell)
		points_dic[index] = cell
		astar.add_point(index, Vector3(cell.x, cell.y, 0.0))

func calculate_point_index(point):
	return int(point.x + 16 * point.y)

func connect_points():
	
	for index in points_dic.keys():
		
		var point = points_dic.get(index)
		
		# For every cell in the map, we check the one to the top, right.
		# left and bottom of it. 
		# We connect the current point with it
		
		var points_relative = PoolVector2Array([
			Vector2(point.x + 1, point.y),
			Vector2(point.x - 1, point.y),
			Vector2(point.x, point.y + 1),
			Vector2(point.x, point.y - 1)])
		for point_relative in points_relative:
			var point_relative_index = calculate_point_index(point_relative)

			if not astar.has_point(point_relative_index):
				continue
			# Note the 3rd argument. It tells the astar_node that we want the
			# connection to be bilateral: from point A to B and B to A
			# If you set this value to false, it becomes a one-way path
			# As we loop through all points we can set it to false
			astar.connect_points(index, point_relative_index, false)



func travel_to(destination):
	
	var player_location= $PlayerToken.global_position
	if destination.rect_position == player_location:
		print('Invalid travel destination. You are allready there')
		return
	#	Sacar smoohing antes de cambiar
	map_camera.smoothing_enabled = false
	map_camera.touch_enabled = false
	map_camera.move($PlayerToken.global_position)
	
	yield(map_camera, 'animation_finished')
	

	
	map_camera.current = false
	$PlayerToken/PlayerCamera.current = true
	
	
	map_camera.position = destination.rect_position
	
	print('Traveling to ', destination.name)
	$PlayerToken.move_along_path(calculate_path_to(player_location, destination))
	user_interface.set_actions(destination)

func calculate_path_to(origin, destination):
	origin = calculate_point_index(origin /16)
	destination = calculate_point_index(destination.rect_position/16)
	
	var vec3_path = astar.get_point_path(origin, destination)
	var path = []
	for point in vec3_path:
		path.append(Vector2(point.x*16, point.y*16))
	return path



func _on_PlayerToken_arrived_at_destination():
	$PlayerToken/PlayerCamera.current = false
	user_interface.update_actions()
	map_camera.current = true
	map_camera.smoothing_enabled = true
	map_camera.touch_enabled = true











