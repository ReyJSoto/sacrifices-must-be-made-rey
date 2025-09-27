extends RigidBody2D

var picked = false

func _physics_process(delta:):
	if picked == true:
		self.position = get_node("../Player/Positon2D").global_position
