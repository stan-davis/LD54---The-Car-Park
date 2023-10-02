extends CharacterBody3D

@onready var pathfind_component := $PathfindComponent
@onready var anim_player = $AnimationPlayer
@onready var engine_audio = $EngineAudio

var state_machine := StateMachine.new()

func _ready():
	state_machine.add_state(state_idle)
	state_machine.add_state(state_chase)
	state_machine.set_initial_state(state_idle)
	hide()

func _physics_process(delta):
	state_machine.update()

func state_idle():
	if GameplayGlobal.current_progress == GameplayGlobal.Progress.CAR_KEYS_FOUND:
		state_machine.change_state(state_chase)
		show()
		anim_player.play("chase")
		engine_audio.play()

func state_chase():
	pathfind_component.set_target_to_player()
	pathfind_component.follow_path()
	
	look_at(pathfind_component.player_node.global_position)
	
	if pathfind_component.player_node.global_position.distance_to(global_position) > 5:
		velocity.y = 0
		move_and_slide()
	
	if GameplayGlobal.current_progress == GameplayGlobal.Progress.END:
		state_machine.change_state(state_idle)
