//=====================================================================
// BlitzBox
// Ferrite Antenna V-Block
//
// Project : BlitzBox
// File    : BlitzBox_Base_V-Block.scad
// Author  : Björn Verbruggen + ChatGPT
//
// Description
// ------------
// Universal V-block for mounting Blitzortung H-Field ferrite antennas.
//
// Version
// -------
// v0.1
//=====================================================================



//=====================================================================
// PARAMETERS
//=====================================================================

//--------------------------------------------------
// Ferrite antenna
//--------------------------------------------------

antenna_diameter = 16;      // mm

//--------------------------------------------------
// Ferrite geometry
//--------------------------------------------------

ferrite_diameter = 15.5;

support_spacing = 80;

support_low_height = 20;

support_high_height = 40;

//--------------------------------------------------
// Block
//--------------------------------------------------

block_length = 40;          // mm
block_width  = 24;          // mm
default_block_height = 20;  // mm



//--------------------------------------------------
// V groove
//--------------------------------------------------

v_depth = 0;               // mm

// Leave a small flat section at each end
v_end_margin = 2;           // mm



//--------------------------------------------------
// Cable ties
//--------------------------------------------------

tie_slot_width  = 4.5;      // Width of cable tie
tie_slot_height = 3.5;      // Height of slot
tie_slot_length = 6.0;      // Length of one slot

// Distance from block ends
tie_slot_end_margin = 7.0;

// Distance from side wall to slot centre
tie_slot_side_margin = 6.0;

//--------------------------------------------------
// Boolean operations
//--------------------------------------------------

boolean_overlap = 1;        // mm

//--------------------------------------------------
// Positioning holes
//--------------------------------------------------

position_hole_diameter = 4.2;      // mm
position_hole_depth    = 4.0;      // mm

// Distance from each end of the block
position_hole_margin   = 6.0;      // mm




//=====================================================================
// DERIVED DIMENSIONS
//=====================================================================

groove_length = block_length - (2 * v_end_margin);

slot_front_x = tie_slot_end_margin;
slot_back_x  = block_length - tie_slot_end_margin - tie_slot_length;

slot_left_y  = tie_slot_side_margin - (tie_slot_width / 2);
slot_right_y = block_width - tie_slot_side_margin - (tie_slot_width / 2);

position_hole_offset = 4.5;

position_hole_left_x  = position_hole_offset;
position_hole_right_x = block_length - position_hole_offset;

position_hole_y = block_width / 2;


//=====================================================================
// MODULES
//=====================================================================


//--------------------------------------------------
// Block
//--------------------------------------------------

module block(block_height = default_block_height)
{
    cube([
        block_length,
        block_width,
        block_height
    ]);
}



//--------------------------------------------------
// V groove
//
// Cuts the V-groove using a rotated cube.
//--------------------------------------------------

module v_groove(support_height)
{
    groove_size = max(block_width, support_height) * 2;

    cutter_z = support_height + (groove_size / 2) - v_depth;

    translate([
        block_length / 2,
        block_width / 2,
        cutter_z
    ])

    rotate([-45,0,180])

    cube(
    [
        groove_length + boolean_overlap + 20,
        groove_size,
        groove_size
    ],
    center = true);
}

//--------------------------------------------------
// Cable tie slots
//
// Two slots running across the V-block.
//--------------------------------------------------

module cable_tie_slots()
{

    slot_length = block_width + (2 * boolean_overlap);

    slot_depth  = 8;

    // Left slot

    translate([
        8,
        -boolean_overlap,
        -boolean_overlap
    ])

    cube([
        slot_depth,
        slot_length,
        tie_slot_height + boolean_overlap
    ]);


    // Right slot

    translate([
        block_length - 8 - slot_depth,
        -boolean_overlap,
        -boolean_overlap
    ])

    cube([
        slot_depth,
        slot_length,
        tie_slot_height + boolean_overlap
    ]);

}

//--------------------------------------------------
// Positioning holes
//
// Blind holes for locating the V-block
//--------------------------------------------------

module positioning_holes()
{

    // Left hole

    translate([
        position_hole_left_x,
        position_hole_y,
        -boolean_overlap
    ])

    cylinder(
        d = position_hole_diameter,
        h = position_hole_depth + boolean_overlap
    );


    // Right hole

    translate([
        position_hole_right_x,
        position_hole_y,
        -boolean_overlap
    ])

    cylinder(
        d = position_hole_diameter,
        h = position_hole_depth + boolean_overlap
    );

}
//--------------------------------------------------
// V-block
//
// Complete printable V-block
//
// Local origin:
// Centre of V-groove on bottom surface.
//--------------------------------------------------

module vblock(support_height = default_block_height)
{
    translate([
        -block_length / 2,
        -block_width  / 2,
        0
    ])
    difference()
    {
        block(support_height);

        v_groove(support_height);

        cable_tie_slots();

 //       positioning_holes();
    }
}


//=====================================================================
// MAIN ASSEMBLY
//=====================================================================

//vblock();