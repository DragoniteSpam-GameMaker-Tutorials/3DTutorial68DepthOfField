function scr_draw_all_the_stuff() {
	var layer_id = layer_get_id("Tiles_1");
	layer_set_visible(layer_id, false);
	var tilemap_id = layer_tilemap_get_id(layer_id);
	draw_tilemap(tilemap_id, 0, 0);
	
    matrix_set(matrix_world, matrix_build(250, 250, 40, 0, 0, 0, 1, 1, 1));
    vertex_submit(vb_merry, pr_trianglelist, -1);
    
    matrix_set(matrix_world, matrix_build(250, 300, 0, 0, 0, 0, 1, 1, 1));
    vertex_submit(vb_sphere, pr_trianglelist, -1);
    matrix_set(matrix_world, matrix_build(250, 350, 0, 0, 0, 0, 1, 1, 1));
    vertex_submit(vb_sphere, pr_trianglelist, -1);
    matrix_set(matrix_world, matrix_build(250, 400, 0, 0, 0, 0, 1, 1, 1));
    vertex_submit(vb_sphere, pr_trianglelist, -1);
    
    for (var i = 0, n = array_length(tree_positions); i < n; i++) {
        matrix_set(matrix_world, matrix_build(tree_positions[i].x, tree_positions[i].y, 0, 0, 0, 0, 1, 1, 1));
        vertex_submit(tree_positions[i].vbuff, pr_trianglelist, -1);
    }
    
    matrix_set(matrix_world, matrix_build_identity());
}