extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var kill = false

func  _process(delta: float) -> void:
	animation_player.speed_scale = 1/Engine.time_scale
	if kill == true:
		animation_player.play("Pick_up")


func _on_kill_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and body.is_in_group("immortal") == false:
		kill = true
	pass # Replace with function body.
