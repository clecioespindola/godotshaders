shader_type canvas_item;

uniform bool effect_enabled = false;
uniform vec4 target_color : source_color = vec4(0.0, 0.0, 0.0, 1.0); // Cor que será detectada
uniform vec4 replace_color : source_color = vec4(1.0, 1.0, 1.0, 1.0); // Cor que vai substituir a cor detectada
uniform float color_threshold : hint_range(0.0, 1.0) = 0.1; // Tolerância de cor

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
	
	if (!effect_enabled) {
        COLOR = tex_color;
    } else {
	
    float dist = distance(tex_color.rgb, target_color.rgb);


    if (dist < color_threshold) {
        // Aplica a cor substituta com pulsação na opacidade
        float final_alpha = clamp(tex_color.a, 0.0, 1.0);
        COLOR = vec4(replace_color.rgb, final_alpha);
    } else {
        // Tudo que não é a cor-alvo vira transparente
        COLOR = vec4(0.0, 0.0, 0.0, 0.0);
    }
	}
}
