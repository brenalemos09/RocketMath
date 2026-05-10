extends Control

@onready var label_pergunta = $VBoxContainer/Label
@onready var btn1 = $VBoxContainer/HBoxContainer/Button
@onready var btn2 = $VBoxContainer/HBoxContainer/Button2
@onready var btn3 = $VBoxContainer/HBoxContainer/Button3

# 🟢 FÁCIL
var perguntas_facil = [
	{"pergunta": "Qual é a cardinalidade de A = {1,2,3}?", "opcoes": ["2", "3", "4"], "resposta": 1},
	{"pergunta": "O que representa A ∩ B?", "opcoes": ["Só A", "Só B", "Elementos\n em comum"], "resposta": 2},
	{"pergunta": "Se A = {1,2,3,4}, quantos elementos tem A?", "opcoes": ["3", "4", "5"], "resposta": 1}
]

# 🟡 MÉDIO
var perguntas_medio = [
	{"pergunta": "10 gostam de matemática,\n 8 de física, 3 dos dois. Quantos gostam de pelo menos um?", "opcoes": ["15", "13", "18"], "resposta": 0},
	{"pergunta": "Se A tem 7 e B tem 5 elementos, \n sem interseção, qual a união?", "opcoes": ["12", "10", "7"], "resposta": 0},
	{"pergunta": "A = 6, B = 4, interseção = 2.\n Qual a união?", "opcoes": ["8", "10", "12"], "resposta": 0}
]

# 🔴 DIFÍCIL
var perguntas_dificil = [
	{"pergunta": "A = 20, B = 15, \n interseção = 5. Quantos no total?", "opcoes": ["30", "25", "35"], "resposta": 0},
	{"pergunta": "Se A ∪ B = 25, \n A = 15 e B = 18, qual a interseção?", "opcoes": ["8", "10", "12"], "resposta": 0},
	{"pergunta": "Se somarmos A + B sem retirar a interseção \n , o que acontece?", "opcoes": ["Falta elementos", "Conta repetido", "Nada muda"], "resposta": 1}
]

var pergunta_atual
var lista_atual

func _ready():
	carregar_lista()
	mostrar_pergunta()

func carregar_lista():
	if Global.dificuldade == "facil":
		lista_atual = perguntas_facil
	elif Global.dificuldade == "medio":
		lista_atual = perguntas_medio
	else:
		lista_atual = perguntas_dificil

func mostrar_pergunta():
	pergunta_atual = lista_atual[Global.pergunta_index]

	label_pergunta.text = pergunta_atual["pergunta"]
	btn1.text = pergunta_atual["opcoes"][0]
	btn2.text = pergunta_atual["opcoes"][1]
	btn3.text = pergunta_atual["opcoes"][2]

func verificar_resposta(indice):
	if indice == pergunta_atual["resposta"]:
		acertou()
	else:
		errou()

func _on_button_pressed():
	verificar_resposta(0)

func _on_button_2_pressed():
	verificar_resposta(1)

func _on_button_3_pressed():
	verificar_resposta(2)

# 🔥 PROGRESSÃO REAL
func acertou():
	Global.pergunta_index += 1

	if Global.pergunta_index >= 3:
		get_tree().change_scene_to_file("res://Cenas/tela_de_vitoria.tscn")
	else:
		voltar_para_fase()

func voltar_para_fase():
	if Global.dificuldade == "facil":
		get_tree().change_scene_to_file("res://Cenas/facil.tscn")
	elif Global.dificuldade == "medio":
		get_tree().change_scene_to_file("res://Cenas/medio.tscn")
	else:
		get_tree().change_scene_to_file("res://Cenas/dificil.tscn")

func errou():
	get_tree().change_scene_to_file("res://Cenas/tela_de_derrota.tscn")
