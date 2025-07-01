extends Node2D

const SCALE: Vector2 = Vector2(1, 1);

const MAX_SPEED: float = 100.0;
const MAX_FORCE: float = 10.0;
const MAX_ALIGNMENT_FORCE: float = 10.0;
const MAX_COHESION_FORCE: float = 10.0;
const MAX_SEPARATION_FORCE: float = 10.0;
const MAX_WANDER_FORCE: float = 10.0;
const MAX_WANDER_RADIUS: float = 10.0;

# Boid properties
var velocity: Vector2 = Vector2.ZERO;
var acceleration: Vector2 = Vector2.ZERO;

# Behavior weights
const ALIGNMENT_WEIGHT: float = 1.0;
const COHESION_WEIGHT: float = 1.0;
const SEPARATION_WEIGHT: float = 1.5;
const WANDER_WEIGHT: float = 0.5;
const BOUNDARY_WEIGHT: float = 1.0;

# Detection ranges
const ALIGNMENT_RADIUS: float = 100.0;
const COHESION_RADIUS: float = 100.0;
const SEPARATION_RADIUS: float = 30.0;

# World boundaries
const WORLD_WIDTH: float = 512.0
const WORLD_HEIGHT: float = 512.0
const BOUNDARY_MARGIN: float = 50.0

# Wander behavior
var wander_angle: float = 0.0
var wander_change: float = 0.3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialize random velocity and position
	velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * MAX_SPEED
	position = global_position
	wander_angle = randf() * TAU

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Get all boids in the scene
	var boids = get_tree().get_nodes_in_group("boids");
	var closer_boids = get_all_close_boids(boids, ALIGNMENT_RADIUS);
	print("Boids in range: ", closer_boids.size());

func _draw() -> void:
	draw_center_point()

func get_all_close_boids(boids: Array, radius: float) -> Array:
	var close_boids = []
	for boid in boids:
		if boid != self and position.distance_to(boid.position) < radius:
			close_boids.append(boid)
	return close_boids

# draw the center point of the boid
func draw_center_point() -> void:
	draw_circle(Vector2.ZERO, 5, Color(1, 0, 0, 1)) # Draw a red circle at the center
	draw_line(Vector2.ZERO, Vector2(10, 0), Color(0, 1, 0, 1), 2) # Draw a green line to the right
	draw_line(Vector2.ZERO, Vector2(0, -10), Color(0, 0, 1, 1), 2) # Draw a blue line upwards