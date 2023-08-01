extends State
class_name Wander

@onready var person = get_parent().get_parent()
@onready var screen_size = get_viewport().get_visible_rect().size
var direction: Vector2
var wander_time: float
@export var wait_time: float
@export var wander_speed: float
var wandering = false

func enter():
	randomize_wander()


func update(delta):
	if wander_time <= 0 and wandering:
		pause_wander()
	else:
		wander_time -= delta
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		changeState.emit()
		pass



func physics_update(delta):
	person.velocity = (wander_speed * direction)


func randomize_wander():
	var target = Vector2(randf_range(0,screen_size.x),randf_range(0,screen_size.y))
	direction = person.global_position.direction_to(target)
	wander_time = randf_range(2,4)
	wandering = true


func pause_wander():
	person.velocity = Vector2.ZERO
	direction = Vector2.ZERO
	wandering=false
	await get_tree().create_timer(wait_time).timeout
	randomize_wander()
	pass
