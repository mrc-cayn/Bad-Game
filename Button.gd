extends CheckButton

var state:int = -1

func _on_toggled(toggled_on: bool) -> void:
	state = -state
	if get_parent() != Window :
		if state == 1 :
			get_parent().activate()
		if state == -1 :
			get_parent().deactivate()
	print(state)
	pass # Replace with function body.
