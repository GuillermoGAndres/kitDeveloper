extends KinematicBody2D

#Plantilla de un juegador que tiene gravedad, puede saltar y moverse
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravedad = 200;
var velocity = Vector2();
var normal = Vector2(0,-1) #Un vector normal
var speed = 250 #Rapidez
var jump = 150 # Tiene un salto
#var collider cuando se use collider

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	readInputs()
	#Crear la gravedad
	# velocidad[m/s] =  [m/s^2] * [s]
	velocity.y += gravedad * delta
	#Dependiendo de la dinamica puede moverse el jugar de dos maneras
	#Utilizando un collider para detectar las colisiones, y en esa caso, se
	#debe de multiplicar por delta para obtener el desplazamiento
	# desplazamiento = [m/s] * [s]
#	var collider = move_and_collide(velocity * delta)
#	if(collider): #Entra si detecto una colision
#		if(collider.collider.is_in_group()):
#			#Procesar Informacion
#			pass
#		pass
#	pass
	#Otra utilzando la funcion move_and_slide, esta ya calcula el vector
	#de delplazmiento, y tambien calcula la estabilicdad cuando caes si le
	#pasas el vector normal, al agregar a la normal puedes llamar funcions
	#is_floor(), is_wall(), is_techo
	velocity = move_and_slide(velocity, normal)
	print(velocity)

func readInputs():
	#Si no se presiona ninguno ni derecha ni izquiera entonces, que no se
	#mueva el jugardor
	velocity.x = 0
	#Devuelve un booleano si se presiona
	#Basic : Mover dereche e izquierda
	if(Input.is_action_pressed("ui_right")):
		velocity.x = speed
	elif (Input.is_action_pressed("ui_left")):
		velocity.x = -speed
	
	#Detectar el salto
	if(Input.is_action_pressed("ui_up")):
		velocity.y = -jump #Negativo por el eje de coordenadas es diferente
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
