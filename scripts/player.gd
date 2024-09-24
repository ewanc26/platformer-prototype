extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -250.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction and handle movement.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Handle animations.
	if is_on_floor():
		if direction != 0:
			animated_sprite.play("run") # Play "run" when moving.
		else:
			animated_sprite.play("idle") # Play "idle" when standing still.
	else:
		animated_sprite.play("jump") # Play "jump"

	# Flip the sprite based on movement direction.
	if direction < 0:
		animated_sprite.flip_h = true  # Face left.
	elif direction > 0:
		animated_sprite.flip_h = false # Face right.
		
	move_and_slide()
