extends CharacterBody2D

const VELOCIDADE_FRENTE = 200.0
const VELOCIDADE_VERTICAL = 300.0

const LIMITE_CIMA = 30
const LIMITE_BAIXO = 310

func _physics_process(_delta):

	var direcao_y = 0.0

	# CONTROLE TECLADO
	direcao_y = Input.get_axis("ui_up", "ui_down")

	# CONTROLE TOUCH MOBILE
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):

		var toque_y = get_viewport().get_mouse_position().y
		var metade_tela = get_viewport().get_visible_rect().size.y / 2

		# TOCOU EM CIMA
		if toque_y < metade_tela:
			direcao_y = -1

		# TOCOU EMBAIXO
		else:
			direcao_y = 1

	velocity.x = VELOCIDADE_FRENTE
	velocity.y = direcao_y * VELOCIDADE_VERTICAL

	move_and_slide()

	global_position.y = clamp(
		global_position.y,
		LIMITE_CIMA,
		LIMITE_BAIXO
	)
