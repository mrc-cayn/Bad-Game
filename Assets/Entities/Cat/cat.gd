extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer

@export var speed:int = 5
@export var jump_velocity:int = 40
@export var time:float = 1
@export var gravity:int = 10
var target_pos :Vector2 = Vector2.ZERO
var dir : Vector2 = Vector2.ZERO

func  _ready() -> void:
	timer.wait_time = time
	timer.start()

func _process(delta: float) -> void:
	target_pos = get_tree().get_first_node_in_group("target").position


func  _physics_process(delta: float) -> void:
	dir = position.direction_to(target_pos)
	#print(dir)
	move()
	move_and_slide()
	
	
func move():
	if is_on_floor() == false:
		velocity.y += gravity
	if is_on_floor():
		velocity += dir * speed

func _on_timer_timeout() -> void:
	if is_on_floor():
		velocity.y -= jump_velocity * gravity
	velocity.x += randi_range(-2,2) * jump_velocity
	#print("g")
	timer.wait_time = 1 + randfn(0,1)
	pass # Replace with function body.
