extends Node2D

export (PackedScene) var player
export (PackedScene) var MapaInicio
export (PackedScene) var Callejon

var nivelActual = 1

func _ready():
	# Instanciar el mapa
	var lvl1 = MapaInicio.instance()
	add_child(lvl1)
	
	# Instanciar el jugador
	var newPlayer = player.instance()
	add_child(newPlayer)
	
	# Obtener nodos del grupo "spawn"
	var spawn_nodes = get_tree().get_nodes_in_group("spawn")
	print("Nodos en el grupo 'spawn': ", spawn_nodes)  # Mensaje de depuración
	
	if spawn_nodes.size() > 0:
		newPlayer.global_position = spawn_nodes[0].global_position
	else:
		print("Error: No hay nodos en el grupo 'spawn'.")

func CambiarEscena():
	match nivelActual:
		1:
			pass
			get_tree().get_nodes_in_group("nivel")[0].queue_free()
		2:
			pass
