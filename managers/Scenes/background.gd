extends AnimationPlayer

@onready var sprite_2d: Sprite2D = $Node2D/Sprite2D
@onready var sprite_2d_2: Sprite2D = $Node2D/Sprite2D2
@onready var sprite_2d_3: Sprite2D = $Node2D/Sprite2D3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if G.Current_level >= 6 and G.Current_level != 12:
		sprite_2d.self_modulate = Color("858b8d")
		sprite_2d_2.self_modulate = Color("518183")
		sprite_2d_3.self_modulate = Color("3f4347")

	pass # Replace with function body.

func  _process(delta: float) -> void:
	var list = [$Node2D/Sprite2D, $Node2D/Sprite2D2, $Node2D/Sprite2D3]
	
	for i in list :
		i.self_modulate.h += 0.0001
		pass
	
	if G.moving == true :
		var tween := get_tree().create_tween().set_parallel(true)
		tween.tween_property($Node2D,"global_position:x",(4408-256),100)
		tween.tween_property($Node2D,"global_position:y",-320,100)
		
	if Input.is_action_just_pressed("ui_end") :
		sprite_2d.self_modulate = Color("858b8d")
		sprite_2d_2.self_modulate = Color("518183")
		sprite_2d_3.self_modulate = Color("3f4347")
