
extends Panel

var historia = 1
var line = "nada"
var idioma = 1
var input_states = preload("res://scripts/input_states.gd")
var btn_action = input_states.new("accion")
var adelante = input_states.new("btn_right")
var atras = input_states.new("btn_left")
var opacidad = 0
var fade = 40
var fade_frame = 0
var ID


var texto

var dialog_dict = {
	
	nada = "",
	historia1 = "[fill]Mi pueblo Yanomami ha estado comiendo su alimento crudo porque no tienen fuego, uno de los chamanes tenía fuego oculto y se iba a la selva para cocinar alimento solo para el y su mujer. Hace unos días se descubrió que guardaba el fuego en su estómago y la única manera de sacárselo fué haciéndolo reír. Sin embargo su mujer es malvada, ha enviado una ave para que se lleve el fuego lejos y ha lanzado una maldición al pueblo, que con ese mismo fuego los cremaran cuando mueran y beberán sus huesos.[/fill][center] NECESITAMOS TU AYUDA PARA ATRAPAR EL AVE QUE SE LLEVÓ EL FUEGO Y ENCENDER UN ÁRBOL ALTO PARA QUE ESPARSA BRASAS A TODAS LAS PERSONAS DEL PUEBLO.",
	historia2 = "[fill][b]En ésta [color=green]misión[/color][/b] deberás perseguir el ave hasta que puedas quitarle el fuego, ten cuidado de no quedarte mucho tiempo detrás de ella o las chispas de fuego te quemarán; la mejor forma es saltandole arriba.",
	historia3 = "[fill]Observa encima de los árboles, es posible que encuetres algunas cosas útiles.",
	historia4 = "[fill]No te confíes en las maderas del camino, ultimamente el puente se ha estado cayendo por las lluvias.",




}




var dialog_dict2 = {
	nada = "",
	historia1 = "[fill](Ingles) Mi pueblo Yanomami ha estado comiendo su alimento crudo porque no tienen fuego, uno de los chamanes tenía fuego oculto y se iba a la selva para cocinar alimento solo para el y su mujer. Hace unos días se descubrió que guardaba el fuego en su estómago y la única manera de sacárselo fué haciéndolo reír. Sin embargo su mujer es malvada, ha enviado una ave para que se lleve el fuego lejos y ha lanzado una maldición al pueblo, que con ese mismo fuego los cremaran cuando mueran y beberán sus huesos.[/fill][center] NECESITAMOS TU AYUDA PARA ATRAPAR EL AVE QUE SE LLEVÓ EL FUEGO Y ENCENDER UN ÁRBOL ALTO PARA QUE ESPARSA BRASAS A TODAS LAS PERSONAS DEL PUEBLO.",
	historia2 = "[fill][b](ingles) En ésta [color=green]misión[/color][/b] deberás perseguir el ave hasta que puedas quitarle el fuego, ten cuidado de no quedarte mucho tiempo detrás de ella o las chispas de fuego te quemarán; la mejor forma es saltandole arriba.",
	historia3 = "[fill](ingles) Observa encima de los árboles, es posible que encuetres algunas cosas útiles.[/fill]",
	historia4 = "[fill](ingles) No te confíes en las maderas del camino, ultimamente el puente se ha estado cayendo por las lluvias.",

# 	historia4 = "[center]cuarto ingles del sgundo[/center]",
}


var dialog_dict3 = {
	nada = "",
	historia1 = "[fill](yanomami) Mi pueblo Yanomami ha estado comiendo su alimento crudo porque no tienen fuego, uno de los chamanes tenía fuego oculto y se iba a la selva para cocinar alimento solo para el y su mujer. Hace unos días se descubrió que guardaba el fuego en su estómago y la única manera de sacárselo fué haciéndolo reír. Sin embargo su mujer es malvada, ha enviado una ave para que se lleve el fuego lejos y ha lanzado una maldición al pueblo, que con ese mismo fuego los cremaran cuando mueran y beberán sus huesos.[/fill][center] NECESITAMOS TU AYUDA PARA ATRAPAR EL AVE QUE SE LLEVÓ EL FUEGO Y ENCENDER UN ÁRBOL ALTO PARA QUE ESPARSA BRASAS A TODAS LAS PERSONAS DEL PUEBLO.",
	historia2 = "[fill][b](yanomami) En ésta [color=green]misión[/color][/b] deberás perseguir el ave hasta que puedas quitarle el fuego, ten cuidado de no quedarte mucho tiempo detrás de ella o las chispas de fuego te quemarán; la mejor forma es saltandole arriba.",
	historia3 = "[fill](yanomami) Observa encima de los árboles, es posible que encuetres algunas cosas útiles.[/fill]",
	historia4 = "[fill](yanomami) No te confíes en las maderas del camino, ultimamente el puente se ha estado cayendo por las lluvias.",






}

func _ready():
	add_to_group("dialogue_box")
	add_to_group("Idioma_GUI")
	add_to_group("font_idioma")
	set_opacity(0)
	texto = get_node("texto")
	texto.set_size( get_size() - Vector2(50, 50) )
	ID = get_node("Label")
#	print (idioma)
	show_dialog( line )

	set_process(true)

#	idioma = get_owner().get_node("idioma_gui_save").idioma




#----Idiomas, viene de idioma gui------- 
func set_idioma1():
	idioma = 1

func set_idioma2():
	idioma = 2

#	get_tree().reload_current_scene()
func set_idioma3():
	idioma = 3

#----------------------------


func show_dialog( line ):
#	if idioma == 1:
		
#		texto.set_bbcode( dialog_dict[line] )
		set_opacity(opacidad)

#	if idioma == 2:
#		texto.set_bbcode( dialog_dict2[line] )
#		set_opacity(opacidad)

#	if idioma == 3:
#		texto.set_bbcode( dialog_dict3[line] )
#		set_opacity(opacidad)

#	print(dialog_dict[line])
#	print (idioma)










func _process(delta):
#	print(fade)

	if historia == 3:
		get_owner().get_node("TouchScreenButton").show()

	texto.set_bbcode(get_node("Label").get_text())
	
	
	if  adelante.check() == 3:
		_on_TouchScreenButton_adelante_pressed()
	if  atras.check() == 3:
		_on_TouchScreenButton_atras_pressed()



	if opacidad < 1:
		opacidad += 0.02
		show_dialog( line )

#-----------------------------
	if fade != 100:
		fade += 1

	if fade == 40:
		get_owner().get_node("AnimationPlayer").play("fade_in")


#----------------------------------
	if fade_frame != 100:
		fade_frame += 1







	#------------------------
	if historia == 0:
		end_dialog()
	
	if historia == 1:
		ID.set_text("relato horonami")
#		show_dialog(line)
#		line = "historia1"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(5)


	if historia == 2:
		ID.set_text("consejo ascensores")
#		show_dialog(line)
#		line = "historia2"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(6)
		
		
	if historia == 3:
		ID.set_text("consejo salto")
#		show_dialog(line)
#		line = "historia3"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(7)


	if historia == 4:
		ID.set_text("consejo tablas")
#		show_dialog(line)
#		line = "historia4"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(4)


	if historia == 5:
		ID.set_text("pedir pluma")
#		show_dialog(line)
#		line = "historia5"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(5)


	if historia == 6:
		ID.set_text("historia fuego")
#		show_dialog(line)
#		line = "historia6"
		if fade_frame == 40:
			get_owner().get_node("imagenes").set_frame(6)




#---------- NUMERO DE LAMINAS A MOSTRAR -----------------------
func _on_TouchScreenButton_adelante_pressed():
	if historia != 3:
		historia += 1
		opacidad = 0
		fade = 0
		fade_frame = 0
		get_owner().get_node("AnimationPlayer").play("fade_out")
		get_owner().get_node("fx").play("papel3")
		




func _on_TouchScreenButton_atras_pressed():
	if historia != 1:
		historia -= 1
		opacidad = 0
		fade = 0
		fade_frame = 0
		get_owner().get_node("AnimationPlayer").play("fade_out")
		get_owner().get_node("fx").play("papel3")






func end_dialog():
	set_opacity( 0 )
#	texto.set_bbcode( "" )
	ID.set_text("")











