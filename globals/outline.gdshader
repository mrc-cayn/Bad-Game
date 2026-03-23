shader_type canvas_item;
uniform vec4 outline_cotor : source_color = vec4(0.0,0.0,0.0,0.1);
uniform bool corner_pixet = false ;

void fragment() {
	vec4 base = texture(TEXTURE,UV);
	if (base.a > 0.0) {
		COLOR = base ;
	}
	
	else {
		vec2 image_pixel_size = TEXTURE_PIXEL_SIZE;
		bool valid_side =
			texture(TEXTURE,UV + vec2(-image_pixel_size.x,0)).a > 0.0  ||
			texture(TEXTURE,UV + vec2(image_pixel_size.x,0)).a > 0.0 ||
			texture(TEXTURE,UV + vec2(0,-image_pixel_size.y)).a > 0.0 ||
			texture(TEXTURE,UV + vec2(0,image_pixel_size.y)).a > 0.0;
		bool valid_corner =
			texture (TEXTURE ,UV + vec2(-image_pixel_size.x,-image_pixel_size.y)).a > 0.0 ||
			texture (TEXTURE ,UV + vec2(image_pixel_size.x,-image_pixel_size.y)).a > 0.0 ||
			texture (TEXTURE ,UV + vec2(-image_pixel_size.x,image_pixel_size.y)).a > 0.0 ||
			texture (TEXTURE ,UV + vec2(image_pixel_size.x,image_pixel_size.y)).a > 0.0 ;
				}
			}