extends CharacterBody2D

const VELOCIDADE_FRENTE = 200.0
const VELOCIDADE_VERTICAL = 300.0

const LIMITE_CIMA = 30
const LIMITE_BAIXO = 310

func _physics_process(_delta):
	var direcao_y = Input.get_axis("ui_up", "ui_down")

	velocity.x = VELOCIDADE_FRENTE
	velocity.y = direcao_y * VELOCIDADE_VERTICAL

	move_and_slide()

	global_position.y = clamp(global_position.y, LIMITE_CIMA, LIMITE_BAIXO)
