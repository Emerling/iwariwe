
extends CanvasLayer

# member variables here, example:
# var a=2
# var b="textvar"
#var mensaje = 1

func _ready():
	# Initialization here
	print("test")
	get_node("left_inputs").set_pos(Vector2(0,get_node("/root/global").viewport_res.y))
	get_node("left_inputs").set_scale(get_node("left_inputs").get_scale() / get_node("/root/global").viewport_scale)
	
	get_node("right_inputs").set_pos(get_node("/root/global").viewport_res)
	get_node("right_inputs").set_scale(get_node("right_inputs").get_scale() / get_node("/root/global").viewport_scale)

#	mensaje = get_parent().get_node("gui/bonos_collected")
#	get_node("gui_text/splash/label").set_text(str(mensaje))