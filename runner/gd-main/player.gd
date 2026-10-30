
extends CharacterBody2D

const SPEED = 2000.0
const JUMP_VELOCITY = -320.0
const GRAVITY = 900.0

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Horizontal movement
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	move_and_slide()
