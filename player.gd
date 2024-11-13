extends CharacterBody2D


const SPEED = 150
const JUMP_VELOCITY = 600
var gravity  = 15


func _physics_process(delta: float) -> void:
	var dir  = -Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")
	if Input.get_action_strength("ui_up") and is_on_floor():
		#гравитация
		velocity.y -= JUMP_VELOCITY
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump")
	velocity.y += gravity
	if dir != 0:
		if is_on_floor():
			$AnimatedSprite2D.play("run")
			velocity.x  = SPEED * dir
			if dir == -1:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite2D.play("idle")
	move_and_slide()
	
func death():
	get_tree().reload_current_scene()
