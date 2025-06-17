shader_type canvas_item;

uniform float blink_speed : hint_range(0.0, 20.0) = 10.0;
uniform float blink_intensity : hint_range(0.0, 1.0) = 1.0;
uniform bool blinking_enabled = false;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    if (blinking_enabled) {
        // Oscila entre cor normal e branco
        float blink = abs(sin(TIME * blink_speed)) * blink_intensity;
        vec4 blink_color = vec4(1.0, 1.0, 1.0, tex_color.a);
        COLOR = mix(tex_color, blink_color, blink);
    } else {
        COLOR = tex_color;
    }
}