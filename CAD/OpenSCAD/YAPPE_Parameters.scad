//=====================================================================
// YAPPE Parameters
//=====================================================================


//--------------------------------------------------
// Bottom plate
//--------------------------------------------------

bottom_length = 170;       // mm
bottom_width  = 85;        // mm

bottom_thickness = 4;      // mm

corner_radius = 8;         // mm

//--------------------------------------------------
// Wall
//--------------------------------------------------

bottom_flange = 3;         // mm

wall_height   = 60;        // mm
wall_thickness = 3;        // mm

//--------------------------------------------------
// Bridges
//--------------------------------------------------

bridge_length = 90;
bridge_width  = 8;
bridge_height = 8;

// Distance from centre to each bridge

bridge_offset = 22;
//--------------------------------------------------
// Derived
//--------------------------------------------------

wall_length =
    bottom_length -
    (2 * bottom_flange);

wall_width =
    bottom_width -
    (2 * bottom_flange);
	





//--------------------------------------------------
// Rendering
//--------------------------------------------------

preview_fn = 24;
render_fn  = 128;

$fn = $preview ? preview_fn : render_fn;