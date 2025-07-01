extends Node2D;

const BOID_SCENE = preload("res://characters/boid.tscn");
const NUM_BOIDS = 5;
const WORLD_WIDTH = 512.0;
const WORLD_HEIGHT = 512.0;

func _ready():
	spawn_boids()

func spawn_boids():
	for i in range(NUM_BOIDS):
		var boid = BOID_SCENE.instantiate();
		# get the center point of the boid itself
		boid.global_position = Vector2.ZERO;
		boid.position = Vector2(
			randf_range(0, WORLD_WIDTH),
			randf_range(0, WORLD_HEIGHT)
		);
		$BoidSpawner.add_child(boid);

func _draw():
	draw_world_boundaries()

func draw_world_boundaries():
	draw_rect(Rect2(0, 0, WORLD_WIDTH, WORLD_HEIGHT), Color(1, 1, 1, 0.5), false)
