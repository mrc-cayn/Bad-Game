extends CheckButton

var power:bool = false
@export var state:int = -1

func _on_toggled(toggled_on: bool) -> void:
	state = -state
	if state == 1 :
		get_parent().activate()
		power = true
	if  state == -1 :
		get_parent().deactivate()
		power = false
	pass # Replace with function body

func _physics_process(delta: float) -> void:
	if power == true :
		get_parent().activate()
	else:
		pass
