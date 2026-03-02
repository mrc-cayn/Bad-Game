extends CheckButton

var power:bool = false
var state:int = -1

func _on_toggled(toggled_on: bool) -> void:
	state = -state
	if get_parent() != Window :
		if state == 1 :
			power = true
		if  state == -1 :
			get_parent().deactivate()
			power = false
	print(state)
	pass # Replace with function body

func _physics_process(delta: float) -> void:
	if power == true :
		get_parent().activate()
	else:
		pass
