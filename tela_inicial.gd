extends CanvasLayer

func _on_butfacil_pressed():
	Global.dificuldade = "facil"
	Global.pergunta_index = 0
	get_tree().change_scene_to_file("res://Cenas/facil.tscn")

func _on_butmedio_pressed():
	Global.dificuldade = "medio"
	Global.pergunta_index = 0
	get_tree().change_scene_to_file("res://Cenas/medio.tscn")

func _on_butdificil_pressed():
	Global.dificuldade = "dificil"
	Global.pergunta_index = 0
	get_tree().change_scene_to_file("res://Cenas/dificil.tscn")
