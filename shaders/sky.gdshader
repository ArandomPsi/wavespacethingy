shader_type canvas_item;
uniform sampler2D texture2 : repeat_enable;
uniform sampler2D colorTexture;
uniform vec2 speed = vec2(0.1,0.1);
uniform vec2 speed2 = vec2(0.2, 0.2);
void fragment() {
	float t = TIME + 1000.0;
	float textureColour1 = texture(TEXTURE, UV + speed * t).r;
	float textureColour2 = texture(texture2, UV + speed * t).r;
	float energy = textureColour1 * textureColour2;
	vec4 color = texture(colorTexture, vec2(energy));
	COLOR = color;
}

