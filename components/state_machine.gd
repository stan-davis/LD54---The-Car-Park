class_name StateMachine extends RefCounted
#Based on Firebelley's callback-based state machine (https://github.com/firebelley)

var current_state

var states = []
var entry_states = {}
var leave_states = {}

func add_state(state, entry_state = null, leave_state = null):
	states.append(state)
	
	if entry_state:
		entry_states[state] = entry_state
	if leave_state:
		leave_states[state] = leave_state

func set_initial_state(state):
	if states.has(state):
		current_state = state

func change_state(state):
	if leave_states.has(current_state):
		leave_states[current_state].call()
	
	current_state = state
	
	if entry_states.has(current_state):
		entry_states[current_state].call()

func update():
	if states.has(current_state):
		current_state.call()
