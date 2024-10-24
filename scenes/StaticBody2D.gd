extends Area2D

var is_transparent = false

func _ready():
	# Asegúrate de que el sprite sea completamente opaco al inicio
	self.modulate.a = 1.0

func _on_Area2D_body_entered(body):
	if body.is_in_group("jugador"):  # Verifica si el cuerpo es el jugador
		# Borra los objetos deseados
		for item in get_tree().get_nodes_in_group("items_a_borrar"):
			item.queue_free()  # Elimina el objeto

		# Cambia a transparente
		self.modulate.a = 0.5  # Cambia la transparencia (0.0 es completamente transparente)

		is_transparent = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("jugador") and is_transparent:
		# Regresa a la opacidad completa si el jugador sale
		self.modulate.a = 1.0
		is_transparent = false
