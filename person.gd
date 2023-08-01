extends CharacterBody2D

@export var type_info: Resource
@onready var aware_of: Array
var acceleration = Vector2.ZERO

#NOTE: Represent network as array of arrays in an effecient way

# Called when the node enters the scene tree for the first time.
func _ready():
	print_type_info()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _physics_process(delta):
	move_and_slide()
	
	

#=================Print, Getters, Setters=======================
func print_type_info():
	for function in type_info.get_functions():
		print("-",type_info.get_function_name(function))


#===========================Signals===========================

func _on_fov_area_entered(area):
	#Add other person to this persons aware_of list
	#aware_of.append(area)
	pass # Replace with function body.


func _on_fov_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var other_owner = area.shape_find_owner(area_shape_index)
	print(other_owner)
	pass # Replace with function body.
