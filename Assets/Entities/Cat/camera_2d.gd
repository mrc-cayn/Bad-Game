extends Camera2D


@onready var shakeTimer = $Timer
@onready var tween = get_tree().create_tween()
@onready var cat: CharacterBody2D = $".."

var shake_amount = 0
var default_offset = offset


func _ready():
	#set_process(false)
	pass


func _process(delta):
	offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(-shake_amount, shake_amount)) * delta + default_offset
	
	
	if G.moving == true :
		if cat.position.x > position.x :
			position.x = cat.position.x
		if cat.position.x <= position.x :
			if $"../../AnimationPlayer2/Camera2D".position.x >= position.x :
				position.x = $"../../AnimationPlayer2/Camera2D".position.x
			else :
				position.x = cat.position.x


func shake(new_shake, shake_time:=1, shake_limit=1000):
	shake_amount += new_shake
	if shake_amount > shake_limit:
		shake_amount = shake_limit
	
	shakeTimer.wait_time = shake_time
	
	tween.play()
	set_process(true)
	shakeTimer.start()


func _on_Timer_timeout():
	shake_amount = 0
	set_process(false)
	
	tween.interpolate_property(self, "offset", offset, default_offset,
	0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.stop()
