
extends TouchScreenButton

var termitente
var animacion
var fx


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	add_to_group("saco")
	termitente = get_node("termitente")
	animacion = get_node("AnimationPlayer")

	fx = get_node("SamplePlayer2D")
	
#	animacion.play("termitente")
	
	pass


func sms_saco():
	animacion.play("termitente")
	fx.play("listo")

	
