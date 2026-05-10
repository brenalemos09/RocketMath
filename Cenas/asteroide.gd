extends Area2D

signal foguete_colodiu

@export var velocidade = 220.0

func _process(delta):
	global_position.x -= velocidade * delta

	if global_position.x < -300:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("foguete"):
		emit_signal("foguete_colodiu", self)
		$CollisionShape2D.set_deferred("disabled", true)
		call_deferred("abrir_pergunta")

func abrir_pergunta():
	get_tree().change_scene_to_file("res://Cenas/operacoes.tscn")
