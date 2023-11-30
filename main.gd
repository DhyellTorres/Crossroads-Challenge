extends Node

signal game_over

const novoCarro = preload("res://carros.tscn")
const novoCarro2 = preload("res://carros2.tscn")

var esquedaDevagar = [544, 384, 216]
var esquedaRapido = [488, 104]

var diretaDevagar = [438, 324, 160]
var direitaRapida = [600, 272]

var score1 = 0
var score2 = 0

func _ready():
	$Button.hide()
	$tema.play()
	randomize()


func _on_hora_carro_rapido_timeout():
	var carroRapidoEsquerda = novoCarro.instantiate()
	add_child(carroRapidoEsquerda)
	carroRapidoEsquerda.position.x = -10
	carroRapidoEsquerda.position.y = esquedaRapido[randi() % esquedaRapido.size()]
	carroRapidoEsquerda.linear_velocity = Vector2(randi_range(700,710),0)
	var carroRapidoDireita = novoCarro2.instantiate()
	add_child(carroRapidoDireita)
	carroRapidoDireita.position.x = 1290
	carroRapidoDireita.position.y = direitaRapida[randi() % direitaRapida.size()]
	carroRapidoDireita.linear_velocity = Vector2(randi_range(-700,-710),0)
	


func _on_hora_carro_devagar_timeout():
	var carroDevagarEsquerda = novoCarro.instantiate()
	add_child(carroDevagarEsquerda)
	carroDevagarEsquerda.position.x = -10
	carroDevagarEsquerda.position.y = esquedaDevagar[randi() % esquedaDevagar.size()]
	carroDevagarEsquerda.linear_velocity = Vector2(randi_range(300,310),0)
	var carroDevagarDireita = novoCarro2.instantiate()
	add_child(carroDevagarDireita)
	carroDevagarDireita.position.x = 1290
	carroDevagarDireita.position.y = diretaDevagar[randi() % diretaDevagar.size()]
	carroDevagarDireita.linear_velocity = Vector2(randi_range(-300,-310),0)


func _on_player_pontua():
	if score1 < 10:
		score1 += 1
		$ponto.play()
		$placar1.text = str(score1)
	if score1 >= 10:
		$Button.show()
		$tema.stop()
		$resultado.text = "P1 Ganhou"
		$ganhou.play()
		$horaCarroDevagar.stop()
		$horaCarroRapido.stop()
		emit_signal("game_over")


func _on_player_2_pontua_2():
	if score2 < 10:
		score2 += 1
		$ponto.play()
		$placar2.text = str(score2)
	if score2 >= 10:
		$Button.show()
		$tema.stop()
		$resultado.text = "P2 Ganhou"
		$ganhou.play()
		$horaCarroDevagar.stop()
		$horaCarroRapido.stop()
		emit_signal("game_over")


func _on_button_pressed():
	$Button.hide()
	get_tree().reload_current_scene()
