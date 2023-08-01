extends Node

@export var initial_state: State
var current_state: State
var states := {}

func _ready():
	# Loop through children and get the script attached
	for child in get_children():
		if child is State:
			states[child.name] = child
	
	if initial_state:
		current_state = initial_state
	elif !states.is_empty():
		current_state = states[states.keys()[0]]
		
	current_state.enter()
	

func _process(delta):
	if current_state:
		current_state.update(delta)
	pass
	
	
func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)
	pass
	




func _on_change_state():
	current_state.exit()
	
	pass # Replace with function body.
