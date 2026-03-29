extends CheckButton

var power:bool = false
@export var state:int = -1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var point_light_2d: PointLight2D 
@onready var click: AudioStreamPlayer2D = $Click


func _ready() -> void:
	if state == 1 :
		button_pressed = true
	if state == -1 :
		button_pressed = false

func _on_toggled(toggled_on: bool) -> void:
	state = -state
	if state == 1 :
		get_parent().activate()
		animated_sprite_2d.play("on_to_off")
		power = true
	if  state == -1 :
		get_parent().deactivate()
		animated_sprite_2d.play('off_to_on')
		power = false
	click.pitch_scale = audio.pitch_shift()
	click.play()
	pass # Replace with function body

func _physics_process(delta: float) -> void:
	if power == true :
		get_parent().activate()
		await  animated_sprite_2d.animation_finished
		point_light_2d.enabled = true
	if power == false :
		await  animated_sprite_2d.animation_finished
		#print("l")
		point_light_2d.enabled = false
		pass
