#version 330

vec4 default_post_processing(vec4 c);

vec4 window_shader() {
  vec2 xy = fragCoord.xy / iResolution.xy;
  vec4 texColor = texture(iChannel0,xy);

  float rr = .3;
  float rg = .769;
  float rb = .189;
  float ra = 0.0;

  float gr = .3;
  float gg = .686;
  float gb = .168;
  float ga = 0.0;

  float br = .272;
  float bg = .534;
  float bb = .131;
  float ba = 0.0;

  float red = (rr * texColor.r) + (rb * texColor.b) + (rg * texColor.g) + (ra * texColor.a);
  float green = (gr * texColor.r) + (gb * texColor.b) + (gg * texColor.g) + (ga * texColor.a);
  float blue = (br * texColor.r) + (bb * texColor.b) + (bg * texColor.g) + (ba * texColor.a);

  texColor = vec4(red,green,blue,1.0);

  return default_post_processing(texColor);

}
