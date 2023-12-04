draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());

var surf_width = surface_get_width(application_surface);
var surf_height = surface_get_height(application_surface);

surface_set_target(surf_blur_h);
draw_clear(c_black);
shader_set(shd_blur_h);

shader_set_uniform_f(shader_get_uniform(shd_blur_h, "texture_size"), surf_width, surf_height);
shader_set_uniform_f(shader_get_uniform(shd_blur_h, "blur_radius"), 10);
draw_surface(application_surface, 0, 0);
surface_reset_target();
shader_reset();

surface_set_target(surf_blur);
draw_clear(c_black);
shader_set(shd_blur_v);

shader_set_uniform_f(shader_get_uniform(shd_blur_v, "texture_size"), surf_width, surf_height);
shader_set_uniform_f(shader_get_uniform(shd_blur_v, "blur_radius"), 10);
draw_surface(surf_blur_h, 0, 0);
surface_reset_target();
shader_reset();