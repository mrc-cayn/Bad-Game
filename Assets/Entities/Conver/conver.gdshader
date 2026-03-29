shader_type canvas_item;

// How many times to repeat (X, Y)
uniform vec2 repeat_factor = vec2(2.0, 2.0);

void fragment() {
    // Determine the size of one individual frame in UV space
    // fwidth allows us to see how much the UV changes per pixel
    vec2 frame_size = fwidth(UV) * (1.0 / TEXTURE_PIXEL_SIZE); 
    
    // Alternatively, for most SpriteFrames, we can derive the 
    // frame UV bounds by looking at the fractional part of the UV
    // provided by the AnimatedSprite2D's internal logic.
    vec2 tiled_uv = fract(UV * repeat_factor);
    
    // We use the 'ATLAS_UV' if using an Atlas, 
    // but for simple AnimatedSprite2D, we just use the built-in UV
    COLOR = texture(TEXTURE, tiled_uv);
}