extends KinematicBody2D

var vel_actual = Vector2()
var vel_desp = 10
var main

func _ready():
	main = get_tree().get_nodes_in_group("main")[0]
	pass 

func _physics_process(_delta):
	vel_actual = Vector2()  # Reiniciar la velocidad actual
	
	if Input.is_action_just_pressed("tecla_X"):
		interactuar_tile()
		pass
	elif Input.is_action_pressed("tecla_W"):
		$DetectarTilsets.rotation_degrees = 0
		vel_actual.y = -vel_desp
		$AnimationPlayer.play("move-Up")
	elif Input.is_action_pressed("tecla_S"):
		$DetectarTilsets.rotation_degrees = 180
		vel_actual.y = vel_desp
		$AnimationPlayer.play("move-Down")
	elif Input.is_action_pressed("tecla_A"):
		$DetectarTilsets.rotation_degrees = 270
		vel_actual.x = -vel_desp
		$AnimationPlayer.play("move-Derecha")
		$Sprite.flip_h = true
	elif Input.is_action_pressed("tecla_D"):
		$DetectarTilsets.rotation_degrees = 90
		vel_actual.x = vel_desp
		$AnimationPlayer.play("move-Derecha")
		$Sprite.flip_h = false
	else:
		# Detener la animación si no hay teclas presionadas
		if $AnimationPlayer.is_playing():
			$AnimationPlayer.stop()

	# Mover el objeto
	move_and_collide(vel_actual)

	# Obtener el número de tile
	if $AnimationPlayer.is_playing():
		var tiles = get_tree().get_nodes_in_group("tiles")
		if tiles.size() > 0:
			var tile_map = tiles[0]
			var tile_position = tile_map.world_to_map($DetectarTilsets/Position2D.global_position)
			var NumeroDeTile = tile_map.get_cellv(tile_position)
			
			match NumeroDeTile:
				42:
					main.CambiarEscena()
					print("Callejon")
					pass
		
			if NumeroDeTile != -1:
				vel_actual = Vector2(0,0)
				if NumeroDeTile != 10:
					vel_actual = Vector2(0, 0)
					#print(NumeroDeTile)
					move_and_collide(vel_actual)
					
func interactuar_tile():
	var tiles = get_tree().get_nodes_in_group("tiles")
	var tile_map = tiles[0]
	var tile_position = tile_map.world_to_map($DetectarTilsets/Position2D.global_position)
	var NumeroDeTile = tile_map.get_cellv(tile_position)
	
	print(NumeroDeTile)
	
	match NumeroDeTile:
				29:
					print("Botella de agua")
					pass
	match NumeroDeTile:
				31:
					print("Rueda")
