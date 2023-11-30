extends RigidBody2D

func _ready():
	var corCarro = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.animation = corCarro[randi() % corCarro.size()]


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
