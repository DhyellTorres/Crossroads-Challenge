extends Area2D

@export var speed = 100
var screen_size
var game_over = false
signal pontua

#pega tamanho da tela
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if not game_over:
		var velocity = Vector2()
		if Input.is_action_pressed("desce"):
			velocity.y += 1
		if Input.is_action_pressed("sobe"):
			velocity.y -= 1
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
		#altera a posição do objeto
		position += velocity * delta
		#não sair da tela
		position.y = clamp(position.y,0,screen_size.y)
		#tocar animações certas
		if velocity.y > 0:
			$AnimatedSprite2D.animation = "baixo"
		elif velocity.y < 0:
			$AnimatedSprite2D.animation = "cima"

#função para as colisões do player
func _on_body_entered(body):
	if body.name == "chegada":
		emit_signal("pontua")
		speed += 0.01 * speed
	else:
		$AnimatedSprite2D.play()
		$colisao.play()
	volta()

func volta():
	position.x = 320
	position.y = 696


func _on_main_game_over():
	game_over = true
	$AnimatedSprite2D.stop()
