extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D
@onready var timer: Timer = $Timer
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var coyote_timer = Timer.new()
@onready var camera_2d: Camera2D = $Camera2D
@onready var light_occluder_2d: LightOccluder2D = $LightOccluder2D
@onready var is_coyote_time_enabled = coyote_time > 0
@export var coyote_time : float = 0.15
@export var friction :float = 2
@export var speed:float = 2
@export var shake_amount:float = 20
@export var max_speed:float = 150
@export var jump_velocity:int = 4
@export var time:float = 2
@export var gravity:int = 5
var motion = Vector2()
var motion_previous = Vector2()
var hit_the_ground = false
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
	
	if G.death == true:
		death()
	#print(position.distance_to(get_global_mouse_position()))
	pass

func death():
	
	camera_2d.shake(shake_amount)
	animated_sprite_2d.speed_scale = Engine.time_scale * animated_sprite_2d.speed_scale  
	animated_sprite_2d.play("Death")

func distance(distance,increment):
		if position.distance_to(get_global_mouse_position()) < distance :
			speed = orignal_speed + (orignal_speed * increment)
			max_speed = orignal_max_speed + (orignal_max_speed * increment)

func  _physics_process(delta: float) -> void:
	motion.y += gravity 
	dir = position.direction_to(get_global_mouse_position())
	#print(dir)
	move()
	if is_on_floor():
		coyote_timer.start()
		velocity.x = lerp(velocity.x,0.0,friction*delta)
	
	motion_previous = motion
	resize(delta)
	move_and_slide()


func resize(delta):
	if not is_on_floor():
		hit_the_ground = false
		$AnimatedSprite2D.scale.y = remap(abs(motion.y), 0.0, abs(jump_velocity * gravity), 0.97, 1.03)
		$AnimatedSprite2D.scale.x = remap(abs(motion.y), 0.0, abs(jump_velocity * gravity), 1.05, 0.95)
		
	elif not hit_the_ground:
		hit_the_ground = true
		$AnimatedSprite2D.scale.x = remap(abs(motion_previous.y), 0.0, 1700.0, 1.1, 1.2)
		$AnimatedSprite2D.scale.y = remap(abs(motion_previous.y), 0.0, 1700.0, 0.8, 0.5)

	$AnimatedSprite2D.scale.x = lerp($AnimatedSprite2D.scale.x, 1.0, 1.0 - pow(0.01, delta))
	$AnimatedSprite2D.scale.y = lerp($AnimatedSprite2D.scale.y, 1.0, 1.0 - pow(0.01, delta))

	$AnimatedSprite2D.scale.x = clamp($AnimatedSprite2D.scale.x, 0.75, 1.25)
	$AnimatedSprite2D.scale.y = clamp($AnimatedSprite2D.scale.y, 0.75, 1.25)


func animate():
	var walking : bool
	
	if is_on_floor() == false :
		if velocity.x > 0 :
			animated_sprite_2d.flip_h = false
			light_occluder_2d.scale.x = 1
			gpu_particles_2d.scale.x = 1
		if velocity.x < 0 :
			animated_sprite_2d.flip_h = true
			light_occluder_2d.scale.x = -1
			gpu_particles_2d.scale.x = -1
	
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
		gpu_particles_2d.emitting = false
		
	if is_on_floor():
		velocity.x += dir.x * speed
		velocity.x = min(velocity.x,max_speed)
		velocity.x = max(velocity.x,-max_speed)
		gpu_particles_2d.emitting = true

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
	motion.y = jump_velocity * gravity



func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player") == false :
		G.death = true
		pass
	pass # Replace with function body.

func is_coyote_timer_running():
	if (is_coyote_time_enabled and not coyote_timer.is_stopped()):
		return true
	
	return false
