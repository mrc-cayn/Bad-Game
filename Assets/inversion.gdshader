shader_type canvas_item;

// This creates the checkbox in the Inspector
uniform bool active = true;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	
	if (active) {
		// If checked, apply the inversion
		COLOR = vec4(1.0 - color.rgb, color.a);
	} else {
		// If unchecked, use the original texture color
		COLOR = color;
	}
}