extends Node3D
#Based on Firebelley's pathfind component (https://github.com/firebelley)

@export var max_speed := 3.0

@export var body : CharacterBody3D = null
@export var target_player := false

@onready var navigation_agent := $NavigationAgent3D
@onready var player_node : Player = null

func _ready():
	if target_player:
		player_node = get_tree().get_first_node_in_group("Player")

func set_target_to_player():
	navigation_agent.target_position = player_node.global_position if player_node else global_position

func set_target_position(target_position : Vector3):
	navigation_agent.target_position = target_position

func follow_path():
	if navigation_agent.is_navigation_finished():
		body.velocity = Vector3.ZERO
		return
	
	var direction : Vector3 = (navigation_agent.get_next_path_position() - global_position).normalized()
	body.velocity = direction * max_speed
	navigation_agent.set_velocity(body.velocity)

func _on_navigation_agent_3d_velocity_computed(safe_velocity : Vector3):
	var new_direction := safe_velocity.normalized()
	var current_direction := body.velocity.normalized()
	var halfway := new_direction.lerp(current_direction, 0.5)
	
	body.velocity = halfway * body.velocity.length()
