extends CharacterBody2D

const VELOCIDADE_FRENTE = 200.0
const VELOCIDADE_VERTICAL = 350.0

func _physics_process(_delta):

	var direcao_y = 0

	# PC
	if Input.is_action_pressed("ui_up"):
		direcao_y = -1

	elif Input.is_action_pressed("ui_down"):
		direcao_y = 1

	# TOUCH MOBILE
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):

		if get_viewport().get_mouse_position().y < get_viewport_rect().size.y / 2:
			direcao_y = -1
		else:
			direcao_y = 1

	velocity.x = VELOCIDADE_FRENTE
	velocity.y = direcao_y * VELOCIDADE_VERTICAL

	move_and_slide()

	# LIMITES AUTOMÁTICOS RESPONSIVOS
	global_position.y = clamp(
		global_position.y,
		40,
		get_viewport_rect().size.y - 40
	)
