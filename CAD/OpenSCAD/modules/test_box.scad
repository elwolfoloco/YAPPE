//=====================================================================
// YAPPE
// Test Box
//
// Tests the generic box() module.
//
//=====================================================================

use <box.scad>


//--------------------------------------------------
// Rendering
//--------------------------------------------------

preview_fn = 24;
render_fn  = 128;

$fn = $preview ? preview_fn : render_fn;


//--------------------------------------------------
// Test dimensions
//--------------------------------------------------

inside_length = 150;
inside_width  = 65;
inside_height = 60;

wall_thickness   = 3;
floor_thickness  = 4;

corner_radius = 8;


//--------------------------------------------------
// Test
//--------------------------------------------------

box(
    inside_length,
    inside_width,
    inside_height,

    wall_thickness,
    floor_thickness,

    corner_radius
);