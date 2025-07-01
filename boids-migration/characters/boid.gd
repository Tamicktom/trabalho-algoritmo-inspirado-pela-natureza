extends Node2D;

const MAX_SPEED: float = 100.0;
const MAX_FORCE: float = 10.0;
const MAX_ALIGNMENT_FORCE: float = 10.0;
const MAX_COHESION_FORCE: float = 10.0;
const MAX_SEPARATION_FORCE: float = 10.0;
const MAX_WANDER_FORCE: float = 10.0;
const MAX_WANDER_RADIUS: float = 10.0;

const WORLD_WIDTH = 512.0;
const WORLD_HEIGHT = 512.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var current_position = position;
	var forward_direction = Vector2.RIGHT.rotated(rotation);
	var target_rotation = rotation;
	
	# Check if outside world boundaries
	var world_center = Vector2(WORLD_WIDTH/2, WORLD_HEIGHT/2);
	var is_outside = has_reached_right_edge() || has_reached_left_edge() || has_reached_top_edge() || has_reached_bottom_edge();
	
	if is_outside:
		# Compute direction to world center
		var to_center = world_center - current_position;
		target_rotation = to_center.angle();
	
	# Smoothly interpolate rotation
	rotation = lerp_angle(rotation, target_rotation, 0.1);
	
	# Update position based on smoothed rotation
	forward_direction = Vector2.RIGHT.rotated(rotation);
	var new_position = current_position + forward_direction * MAX_SPEED * _delta;
	position = new_position;

func has_reached_right_edge() -> bool:
	return position.x >= WORLD_WIDTH;

func has_reached_left_edge() -> bool:
	return position.x <= 0;

func has_reached_top_edge() -> bool:
	return position.y >= WORLD_HEIGHT;

func has_reached_bottom_edge() -> bool:
	return position.y <= 0;
