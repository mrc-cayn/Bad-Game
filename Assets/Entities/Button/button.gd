extends  Button
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_button_down() -> void:
	get_parent().activate()
	animated_sprite_2d.play("On")
	pass # Replace with function body.


func _on_button_up() -> void:
	get_parent().deactivate()
	animated_sprite_2d.play("Off")
	pass # Replace with function body.
