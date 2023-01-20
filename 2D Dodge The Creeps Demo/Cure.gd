extends RigidBody2D


func _ready():
	$AnimatedSprite.playing = true
	var cure_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = cure_types[randi() % cure_types.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

