extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer
@onready var coyote_timer = Timer.new()
@export var coyote_time : float = 0.15
@onready var is_coyote_time_enabled = coyote_time > 0
@export var friction :float = 2
@export var speed:float = 2
@export var max_speed:float = 150
@export var jump_velocity:int = 4
@export var time:float = 2
@export var gravity:int = 5
var orignal_speed = 0
var orignal_max_speed = 0
var dir : Vector2 = Vector2.ZERO

func  _ready() -> void:
	
	timer.wait_time = time
	timer.start()
	orignal_speed = speed
	orignal_max_speed = max_speed
	
	if is_coyote_time_enabled:
		add_child(coyote_timer)
		coyote_timer.wait_time = coyote_time
		coyote_timer.one_shot = true

func _process(delta: float) -> void:
	for i in range(1,200,10):
		distance(i,25/i)
		pass
	animate()
	#print(position.distance_to(get_global_mouse_position()))
	pass

func distance(distance,increment):
		if position.distance_to(get_global_mouse_position()) < distance :
			speed = orignal_speed + (orignal_speed * increment)
			max_speed = orignal_max_speed + (orignal_max_speed * increment)

func  _physics_process(delta: float) -> void:
	dir = position.direction_to(get_global_mouse_position())
	#print(dir)
	move()
	if is_on_floor():
		coyote_timer.start()
		velocity.x = lerp(velocity.x,0.0,friction*delta)
	move_and_slide()

func animate():
	var walking : bool
	
	if is_on_floor() == false :
		if velocity.x > 0 :
			animated_sprite_2d.flip_h = false
		if velocity.x < 0 :
			animated_sprite_2d.flip_h = true
	
	await animated_sprite_2d.animation_finished
	
	if position.direction_to(get_global_mouse_position()).x > 0 :
		if is_on_floor():
			animated_sprite_2d.flip_h = false
	if position.direction_to(get_global_mouse_position()).x < 0 :
		if is_on_floor():
			animated_sprite_2d.flip_h = true
	
	
	if abs(velocity.x)<5:
		walking = false
	
	if abs(velocity.x)>5:
		walking = true
	
	if is_on_floor() and walking == false :
		animated_sprite_2d.play("walk_transition")
		await animated_sprite_2d.animation_finished
	
	if is_on_floor() and walking == true :
		animated_sprite_2d.play("walk")
		await animated_sprite_2d.animation_finished
	
	else :
		animated_sprite_2d.play("Idle")
		await animated_sprite_2d.animation_finished
		

func move():
	if is_on_floor() == false:
		velocity.y += gravity
		velocity.x += dir.x * speed
	if is_on_floor():
		velocity.x += dir.x * speed
		velocity.x = min(velocity.x,max_speed)
		velocity.x = max(velocity.x,-max_speed)

func _on_timer_timeout() -> void:
	if is_coyote_timer_running() or is_on_floor():
		jump()
	velocity.x += randi_range(-1,1) * speed 
	#print("g")
	timer.wait_time = randfn(2,0.1)
	pass # Replace with function body.

func jump():
	velocity.y -= jump_velocity * gravity
	coyote_timer.stop()



func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player") == false :
		G.death = true
		pass
	pass # Replace with function body.

func is_coyote_timer_running():
	if (is_coyote_time_enabled and not coyote_timer.is_stopped()):
		return true
	
	return false
