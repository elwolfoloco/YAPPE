//=====================================================================
// YAPPE
// Outer Box
//
// Rain cover.
// Fits over the Inner Box.
//
//=====================================================================

use <Modules/box.scad>;
include <YAPPE_Parameters.scad>;

module outer_box()
{
    box(
        outer_inside_length,
        outer_inside_width,
        outer_inside_height,

        wall_thickness,
        floor_thickness,

        corner_radius
    );
}


//=====================================================================
// MAIN
//=====================================================================

outer_box();