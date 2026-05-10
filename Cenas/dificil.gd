extends Node

@export var cena_asteroide: PackedScene

var rng = RandomNumberGenerator.new()
var timer_spawn: Timer

const INTERVALO_SPAWN = 3
const VELOCIDADE_ASTEROIDE = 300.0
const DISTANCIA_SPAWN_X = 700
const MARGEM_CIMA = 80
const MARGEM_BAIXO = 80

func _ready():
	Progresso.iniciar_novo_jogo("dificil")

	if has_node("MusicaAbertura"):
		$MusicaAbertura.play()

	rng.randomize()

	criar_timer_spawn()

	for i in range(5):
		spawnar_asteroide(300 + i * 220)

func criar_timer_spawn():
	timer_spawn = Timer.new()
	timer_spawn.wait_time = INTERVALO_SPAWN
	timer_spawn.autostart = true
	timer_spawn.timeout.connect(spawnar_asteroide)
	add_child(timer_spawn)

func spawnar_asteroide(offset_x: float = DISTANCIA_SPAWN_X):
	if cena_asteroide == null:
		print("ERRO: cena_asteroide não foi colocada no Inspector")
		return

	var foguete = get_tree().get_first_node_in_group("foguete")

	if foguete == null:
		print("ERRO: foguete não está no grupo 'foguete'")
		return

	var asteroide = cena_asteroide.instantiate()
	add_child(asteroide)

	var altura_tela = get_viewport().get_visible_rect().size.y
	var y_aleatorio = rng.randf_range(MARGEM_CIMA, altura_tela - MARGEM_BAIXO)

	asteroide.global_position = Vector2(
		foguete.global_position.x + offset_x,
		y_aleatorio
	)

	asteroide.set("velocidade", VELOCIDADE_ASTEROIDE)
