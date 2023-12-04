#region initial setup
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
#endregion


if (mouse_wheel_up())
    focus_depth += 50;
else if (mouse_wheel_down())
    focus_depth -= 50;

shader_set(shd_dof);

texture_set_stage(shader_get_sampler_index(shd_dof, "sampDepth"), surface_get_texture(surf_depth));
texture_set_stage(shader_get_sampler_index(shd_dof, "sampBlur"), surface_get_texture(surf_blur));
shader_set_uniform_f(shader_get_uniform(shd_dof, "u_near"), 100);
shader_set_uniform_f(shader_get_uniform(shd_dof, "u_far"), 500);
shader_set_uniform_f(shader_get_uniform(shd_dof, "u_focus"), focus_depth);


draw_surface(application_surface, 0, 0);


shader_reset();

draw_text(32, 32, focus_depth);

draw_circle(window_get_width() / 2, window_get_height() / 2, 4, true);