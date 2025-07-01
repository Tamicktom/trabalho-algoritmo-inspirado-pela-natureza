# Boid Algorithm Implementation in Godot

This project implements Craig Reynolds' Boid algorithm in Godot 4, demonstrating emergent flocking behavior through simple local rules.

## Overview

The Boid algorithm simulates flocking behavior using three main rules:

1. **Alignment**: Boids try to match the average direction of nearby boids
2. **Cohesion**: Boids try to move toward the center of mass of nearby boids
3. **Separation**: Boids try to avoid crowding by maintaining minimum distance

## Implementation Details

### Core Behaviors

- **Alignment**: Boids align their velocity with nearby boids within `ALIGNMENT_RADIUS`
- **Cohesion**: Boids move toward the center of mass of nearby boids within `COHESION_RADIUS`
- **Separation**: Boids avoid each other when within `SEPARATION_RADIUS`
- **Wandering**: Boids have a natural tendency to wander using a circular wander behavior
- **Boundary Avoidance**: Boids avoid leaving the world boundaries

### Key Parameters

- `MAX_SPEED`: Maximum velocity of boids (100.0)
- `MAX_FORCE`: Maximum steering force (10.0)
- `ALIGNMENT_RADIUS`: Detection range for alignment (50.0)
- `COHESION_RADIUS`: Detection range for cohesion (50.0)
- `SEPARATION_RADIUS`: Detection range for separation (30.0)
- `BOUNDARY_MARGIN`: Distance from edge to start avoiding boundaries (50.0)

### Behavior Weights

- `ALIGNMENT_WEIGHT`: 1.0
- `COHESION_WEIGHT`: 1.0
- `SEPARATION_WEIGHT`: 1.5 (higher to prevent collisions)
- `WANDER_WEIGHT`: 0.5
- `BOUNDARY_WEIGHT`: 1.0

## How to Run

1. Open the project in Godot 4
2. Open `world.tscn`
3. Press F5 or click the Play button
4. Watch 50 boids flock together with emergent behavior!

## Files

- `characters/boid.gd`: Main boid behavior script
- `characters/boid.tscn`: Boid scene with sprite and collision
- `world.gd`: World management script that spawns boids
- `world.tscn`: Main world scene

## Customization

You can easily modify the behavior by adjusting the constants in `boid.gd`:
- Change detection radii to affect flocking density
- Adjust weights to emphasize different behaviors
- Modify world boundaries and margins
- Change the number of boids in `world.gd`

The algorithm demonstrates how complex emergent behavior can arise from simple local interactions! 