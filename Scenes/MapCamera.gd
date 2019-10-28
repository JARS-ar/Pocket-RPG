extends Camera2D

export(Vector2) var drag_threshold = Vector2()

onready var touch_enabled = OS.has_touchscreen_ui_hint()
onready var tween = $Tween

var dragging = false
var pressed = false
signal animation_finished

# must be _input, as _gui_input has bugs, with no touch.pressed = false events
# see: https://github.com/godotengine/godot/issues/16761
func _input(event):
	if tween.is_active():
		return
	if not visible:
		return
	if not touch_enabled:
		return

	if event is InputEventScreenDrag:
		     
		if event.speed == Vector2():
			print("we're on a device and speed is broken")
            # we're on a device and speed is broken
            # see: https://github.com/godotengine/godot/issues/3623
			event.speed = event.relative
			
		if event.speed.abs() >= drag_threshold:
			
            # scroll the map
			dragging = true
			position -= event.relative
			position.x = clamp(position.x, limit_left+45, limit_right-45)
			position.y = clamp(position.y, limit_top+80, limit_bottom-80)
#			return

	if event is InputEventScreenTouch:
		if event.index == 0:
            
			if dragging && event.pressed == false:
#				prints("end drag")
				dragging = false
				pressed = false
			else:
				if event.pressed && pressed == false:
					# prints("touch start")
					pressed = true
					# TODO: prevent select highlight
				elif !event.pressed && pressed == true:
					# prints("touch end and accept")
					pressed = false
					var ev = InputEventAction.new()
					ev.action = "ui_accept"
					ev.pressed = true
					Input.parse_input_event(ev)

func move(location: Vector2):
	tween.interpolate_property(self, 'position', position, location, 1.0, Tween.TRANS_CUBIC,Tween.EASE_OUT)
	tween.start()
	

func relocate(location:Vector2):
	position = location


func _on_Tween_tween_all_completed():
	emit_signal("animation_finished")


func _process(delta):
	$CanvasLayer/Label.text = str(global_position)