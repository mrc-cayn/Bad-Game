extends  Button

func _on_button_down() -> void:
	get_parent().activate()
	print("lol")
	pass # Replace with function body.


func _on_button_up() -> void:
	get_parent().deactivate()
	pass # Replace with function body.
