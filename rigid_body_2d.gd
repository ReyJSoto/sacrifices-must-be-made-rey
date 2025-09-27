
extends RigidBody2D

@export var throw_force := 1000.0

func _ready():
	# Optional: wait before throwing, or throw on command
	pass

func throw(direction: Vector2):
	linear_velocity = direction.normalized() * throw_force
