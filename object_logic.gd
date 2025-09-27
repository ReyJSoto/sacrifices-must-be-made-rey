extends Node
class_name ObjectLogic

@export
var friction_lerp_weight: float = 16.5
@export var position_lerp_weight: float = 28.5
@export var gravity: float = 1000.0
@export var bounce_amt: float = 160.0
@export var total_bounces: int = 3
var y_velocity: float = 0.0
var x_velocity: float = 0.0
var held_by: Node2D = null

func _ready() -> void:
	get_parent().add_to_group ("can_pickup")

func _physics_process(delta: float) -> void:
	if held_by:
		get_parent().velocity = Vector2.ZERO
		var target_pos: Vector2 = held_by.global_position + Vector2(0, -8)

func pickup (holder: Node2D) -> void:
	held_by = holder
	get_parent().velocity = Vector2.ZERO

func drop(global_pos: Vector2) -> void:
	held_by = null
	var pos_tween: Tween = create_tween().set_trans(Tween.TRANS_SINE)
	pos_tween.tween_property(get_parent(), "global_position", global_pos, 0.05)
	get_parent().velocity = Vector2.ZERO
	
func throw(throw_x: float, throw_height:float) -> void:
	held_by = null
	get_parent().velocity = Vector2(throw_x, throw_height)
	y_velocity = bounce_amt
	x_velocity = throw_x
