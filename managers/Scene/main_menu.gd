extends Node2D
@onready var button_2: Button = $Button2
@onready var popup_menu: PopupMenu = $PopupMenu
@onready var button: Button = $Button

func _on_button_button_up() -> void:
	popup_menu.visible = false
	
	
	
	pass # Replace with function body.


func _on_button_2_button_up() -> void:
	popup_menu.visible = true
	pass # Replace with function body.
