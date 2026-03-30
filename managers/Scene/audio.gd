extends Node2D

@onready var sfx: HSlider = $SFX
@onready var music: HSlider = $Music
@onready var bounce_1: AudioStreamPlayer2D = $SFX/bounce_1
@onready var music_bus := AudioServer.get_bus_index("music")
@onready var SFX_bus := AudioServer.get_bus_index("SFX")

func _ready() -> void:
	music.value = AudioServer.get_bus_volume_linear(music_bus)
	sfx.value = AudioServer.get_bus_volume_linear(SFX_bus)

func _on_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(SFX_bus,sfx.value)
	#audiobu
	pass # Replace with function body.


func _on_music_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(music_bus,music.value)
	print("change")
	pass # Replace with function body.


func _on_sfx_drag_ended(value_changed: bool) -> void:
	bounce_1.play()
	pass # Replace with function body.


func _on_music_mouse_exited() -> void:
	music.release_focus()
	pass # Replace with function body.


func _on_sfx_mouse_exited() -> void:
	sfx.release_focus()
	pass # Replace with function body.
