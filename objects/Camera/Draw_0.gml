/// @description Draw the 3D world

gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);

// 3D projections require a view and projection matrix
var camera = camera_get_active();

var xfrom = Player.x;
var yfrom = Player.y;
var zfrom = Player.z + 64;
var xto = xfrom - dcos(Player.look_dir) * dcos(Player.look_pitch);
var yto = yfrom + dsin(Player.look_dir) * dcos(Player.look_pitch);
var zto = zfrom + dsin(Player.look_pitch);

view_mat = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), znear, zfar);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

shader_set(shd_basic_3d_stuff);
shader_set_uniform_f(shader_get_uniform(shd_basic_3d_stuff, "lightDirection"), 1, 1, -1);
draw_clear(c_black);

scr_draw_all_the_stuff();

shader_reset();

gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);