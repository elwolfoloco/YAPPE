//=====================================================================
// YAPPE Parameters
//
// This file contains the mechanical design parameters.
//
// Geometry modules should not define dimensions.
// They consume the values defined here.
//
//=====================================================================

//--------------------------------------------------
// Pump
//--------------------------------------------------

pump_length = 150;
pump_width  = 65;
pump_height = 60;


//--------------------------------------------------
// Clearances
//--------------------------------------------------

pump_side_clearance = 5;
pump_top_clearance  = 5;

box_fit_clearance = 0.35;


//--------------------------------------------------
// Box
//--------------------------------------------------

wall_thickness  = 3;
floor_thickness = 4;

corner_radius = 8;

//--------------------------------------------------
// Lid overlap
//--------------------------------------------------

lid_overlap = 15;         // mm


//--------------------------------------------------
// Inner box inside dimensions
//--------------------------------------------------

inner_inside_length =
    pump_length +
    (2 * pump_side_clearance);

inner_inside_width =
    pump_width +
    (2 * pump_side_clearance);

inner_inside_height =
    pump_height +
    pump_top_clearance;
	
//--------------------------------------------------
// Inner box outside dimensions
//--------------------------------------------------

inner_outside_length =
    inner_inside_length +
    (2 * wall_thickness);

inner_outside_width =
    inner_inside_width +
    (2 * wall_thickness);

inner_outside_height =
    inner_inside_height +
    floor_thickness;
	
//--------------------------------------------------
// Outer box inside dimensions
//--------------------------------------------------

outer_inside_length =
    inner_outside_length +
    (2 * box_fit_clearance);

outer_inside_width =
    inner_outside_width +
    (2 * box_fit_clearance);

outer_inside_height =
    inner_outside_height +
    lid_overlap;
	
//--------------------------------------------------
// Assembly centres
//--------------------------------------------------

inner_center_x = inner_outside_length / 2;
inner_center_y = inner_outside_width  / 2;

outer_center_x =
    (outer_inside_length + (2 * wall_thickness)) / 2;

outer_center_y =
    (outer_inside_width + (2 * wall_thickness)) / 2;
	
	
//--------------------------------------------------
// Rendering
//--------------------------------------------------

preview_fn = 24;
render_fn  = 128;

$fn = $preview ? preview_fn : render_fn;