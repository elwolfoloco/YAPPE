//=====================================================================
// YAPPE
// Assembly
//
// Exploded view for design verification.
//
//=====================================================================

use <YAPPE_InnerBox.scad>
use <YAPPE_OuterBox.scad>

include <YAPPE_Parameters.scad>


//=====================================================================
// VISUALISATION
//=====================================================================

//--------------------------------------------------
// Assembly origin
//--------------------------------------------------

assembly_origin_x = 175;
assembly_origin_y = 175;

exploded_height = 90;


//--------------------------------------------------
// Inner box
//--------------------------------------------------

translate([
    assembly_origin_x,
    assembly_origin_y,
    0
])
inner_box();


//--------------------------------------------------
// Outer box
//--------------------------------------------------

translate([
    assembly_origin_x,
    assembly_origin_y,
    inner_outside_height + exploded_height
])
rotate([180,0,0])
    outer_box();