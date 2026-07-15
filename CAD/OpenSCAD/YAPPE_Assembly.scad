//=====================================================================
// YAPPE
// Assembly
//
// Exploded view
//
//=====================================================================

use <Modules/box.scad>
use <Modules/bridge.scad>
use <Modules/pump_mount_pattern.scad>
use <Modules/rain_grid.scad>
use <Modules/cable_slot.scad>
use <Modules/hose_slot.scad>

include <YAPPE_Parameters.scad>

//=====================================================================
// VISUALISATION
//=====================================================================

assembly_x = 0;
assembly_y = 0;

exploded_height = 40;


//=====================================================================
// INNER BOX
//=====================================================================

inner_bottom_length = 170;
inner_bottom_width  = 85;

inner_bottom_thickness = 4;

inner_wall_height = 60;
inner_wall_thickness = 3;

inner_bottom_flange = 3;


//=====================================================================
// FIT
//=====================================================================

box_fit_clearance = 0.35;


//=====================================================================
// OUTER BOX
//=====================================================================

// Bottom plate

outer_bottom_length =
    inner_bottom_length +
    (2 * inner_wall_thickness) +
    (2 * box_fit_clearance);

outer_bottom_width =
    inner_bottom_width +
    (2 * inner_wall_thickness) +
    (2 * box_fit_clearance);

outer_bottom_thickness = 4;


// Wall

outer_wall_height = 75;

outer_wall_thickness = 3;

outer_bottom_flange = 3;


//--------------------------------------------------
// Shared
//--------------------------------------------------

corner_radius = 8;


//=====================================================================
// ASSEMBLY
//=====================================================================

//--------------------------------------------------
// Inner box
//--------------------------------------------------

translate([
    assembly_x,
    assembly_y,
    0
])

box(
    inner_bottom_length,
    inner_bottom_width,
    inner_bottom_thickness,

    inner_wall_height,
    inner_wall_thickness,

    inner_bottom_flange,

    corner_radius
);

//--------------------------------------------------
// Bridges
//--------------------------------------------------

translate([
    assembly_x,
    assembly_y - bridge_offset,
    bottom_thickness
])
color("deepskyblue")
bridge(
    bridge_length,
    bridge_width,
    bridge_height
);

translate([
    assembly_x,
    assembly_y + bridge_offset,
    bottom_thickness
])
color("deepskyblue")
bridge(
    bridge_length,
    bridge_width,
    bridge_height
);
//--------------------------------------------------
// Pump mount pattern
//--------------------------------------------------

translate([
    assembly_x,
    assembly_y,
    -88.9
])
color("red")
pump_mount_pattern(
    71,     // Foot spacing X
    43,     // Foot spacing Y

    3.2,    // M3 clearance
    6.5,    // Screw head

    100,    // Through everything
    2.5     // Counterbore depth
);

//--------------------------------------------------
// Rain grid
//--------------------------------------------------
color([1,0,1,0.6])

translate([
    assembly_x,
    assembly_y,
    -1
])

rain_grid(
    115,     // afstand tussen beide openingen
    45,     // lengte
    18,     // breedte
    100     // renderhoogte
);


//--------------------------------------------------
// Cable slot (visualisation)
//--------------------------------------------------

color("orange")

translate([
    -inner_bottom_length / 2,
    assembly_y,
    35
])

rotate([0,0,90])

cable_slot(
    30,
    8,
    20
);


//--------------------------------------------------
// Hose slot (visualisation)
//--------------------------------------------------

color("cyan")

translate([
    inner_bottom_length / 2 -10,
    assembly_y,
    35
])

rotate([0,0,90])

hose_slot(
    30,
    8,
    20
);


//--------------------------------------------------
// Outer box
//--------------------------------------------------

translate([
    assembly_x,
    assembly_y,
    inner_bottom_thickness +
    inner_wall_height +
    exploded_height
])

rotate([180,0,0])
color([0,1,0,0])
box(
    outer_bottom_length,
    outer_bottom_width,
    outer_bottom_thickness,

    outer_wall_height,
    outer_wall_thickness,

    outer_bottom_flange,

    corner_radius
);