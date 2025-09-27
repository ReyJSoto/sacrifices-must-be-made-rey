extends CharacterBody2D


const SPEED = 670.0
const JUMP_VELOCITY = -410.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# Assume you have a reference to the object you're throwing

func _on_throw_button_pressed():
	var direction = Vector2.RIGHT  # Or use mouse direction, etc.
	var object_to_throw = preload("res://ball.png").instantiate()
	add_child(object_to_throw)
	object_to_throw.global_position = global_position
	object_to_throw.throw(direction)
