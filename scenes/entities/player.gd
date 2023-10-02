class_name Player extends CharacterBody3D

#Movement
const move_speed = 4.0 #default 4.0
const move_speed_reduction := 10.0
const air_speed_reduction := 3.0
const sensitivity := 0.01
const max_rotation := deg_to_rad(80)
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#View-bobbing
const bob_freq := move_speed
const bob_amp := 0.04
var bob_time := 0.0
var view_bobbing_enabled := true
var can_play = false

#FOV multiplier
const fov_multiplier := 1.5
const fov_change_speed := 8.0

#Onready
@onready var head := $Head
@onready var camera := $Head/Camera3D
@onready var footstep_audio := $FootstepAudioPlayer

var input := Vector2.ZERO

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * sensitivity)
		camera.rotate_x(-event.relative.y * sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, -max_rotation,  max_rotation)
	
	if event.is_action_pressed("quit"):
		get_tree().quit()

func _process(delta):
	input = Input.get_vector("strafe_left", "strafe_right", "move_forward", "move_backward")

func _physics_process(delta):
	#Movement
	var prev_y = velocity.y
	var direction : Vector3 = (head.transform.basis * Vector3(input.x, 0, input.y)).normalized()
	
	if is_on_floor():
		if direction:
			velocity = direction * move_speed
		else:
			velocity = lerp(velocity, direction * move_speed, delta * move_speed_reduction)
	else:
		velocity = lerp(velocity, direction * move_speed, delta * air_speed_reduction)
		velocity.y = prev_y - gravity * delta
	
	move_and_slide()
	
	bob_time += bob_time_inc(delta)
	camera.transform.origin = view_bobbing(bob_time) * float(view_bobbing_enabled)

func bob_time_inc(delta : float) -> float:
	return delta * velocity.length() * float(is_on_floor())

func view_bobbing(time : float) -> Vector3:
	var vec := Vector3.ZERO
	vec.y = sin(time * bob_freq) * bob_amp
	vec.x = cos(time * bob_freq * 0.5) * bob_amp
	
	#Footstep audio
	var low_pos = bob_amp - 0.05
	
	if vec.y > -low_pos:
		can_play = true
	
	if vec.y < -low_pos and can_play:
		can_play = false
		footstep_audio.play()
	
	return vec
