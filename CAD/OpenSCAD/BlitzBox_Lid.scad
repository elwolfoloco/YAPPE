//=====================================================================
// BlitzBox
// Lid
//
// Project : BlitzBox
// File    : BlitzBox_Lid.scad
// Author  : Björn Verbruggen + ChatGPT
//
// Description
// ------------
// Lid for the BlitzBox enclosure.
//
// The lid contains:
//
// - Labyrinth seal
// - Screw holes
// - UTP cable entry
// - Condensation drain / vent
// - LED viewing hole
//
// Version
// -------
// v0.1
//=====================================================================

use <modules\CableClamp.scad>

//=====================================================================
// PARAMETERS
//=====================================================================


//--------------------------------------------------
// Internal dimensions
//--------------------------------------------------

inside_length = 172;      // mm
inside_width  = 172;      // mm


//--------------------------------------------------
// Lid
//--------------------------------------------------

lid_thickness = 4;         // mm
lid_clearance = -0.25;

//--------------------------------------------------
// Wall dimensions
//--------------------------------------------------

wall_thickness = 3;        // mm

//--------------------------------------------------
// Lid screw holes
//--------------------------------------------------

lid_screw_hole_diameter = 3.3;      // Free fit for M3


//--------------------------------------------------
// Labyrinth
//--------------------------------------------------

labyrinth_height    = 8;      // Vertical skirt
labyrinth_thickness = 2;      // Wall thickness
labyrinth_clearance = 0.35;   // Fit with base
labyrinth_margin = 3;          // mm


//--------------------------------------------------
// Post clearance
//--------------------------------------------------

post_clearance = 14;      // mm

//--------------------------------------------------
// Screw posts  // COPIED FROM BASE
//--------------------------------------------------

screw_post_diameter = 12;
screw_hole_diameter = 2.8;

screw_post_corner_overlap = 2;


//--------------------------------------------------
// Corner radius
//--------------------------------------------------

corner_radius = 8;         // mm


//--------------------------------------------------
// Cable entry
//--------------------------------------------------

cable_x = 15;
cable_y = 121;

cable_rotation = 0;


//--------------------------------------------------
// Cable clamp
//--------------------------------------------------

clamp_width  = 20;
clamp_length = 18;


//--------------------------------------------------
// Rendering
//--------------------------------------------------

preview_fn = 24;
render_fn  = 128;

$fn = render_fn;



//=====================================================================
// DERIVED DIMENSIONS
//=====================================================================

outside_length =
    inside_length +
    (wall_thickness * 2);

outside_width =
    inside_width +
    (wall_thickness * 2);



//=====================================================================
// MODULES
//=====================================================================


//--------------------------------------------------
// Corner
//--------------------------------------------------

module corner(x, y, height)
{

    translate([x,y,0])
    {

        cylinder(
            h = height,
            r = corner_radius
        );

    }

}



//--------------------------------------------------
// Lid plate
//--------------------------------------------------

module lid_plate()
{

    hull()
    {

        corner(
            corner_radius,
            corner_radius,
            lid_thickness
        );

        corner(
            outside_length - corner_radius,
            corner_radius,
            lid_thickness
        );

        corner(
            outside_length - corner_radius,
            outside_width - corner_radius,
            lid_thickness
        );

        corner(
            corner_radius,
            outside_width - corner_radius,
            lid_thickness
        );

    }

}



//--------------------------------------------------
// Labyrinth
//
// Creates a hollow labyrinth wall.
//--------------------------------------------------

module labyrinth()
{

    difference()
    {

        //--------------------------------------------------
        // Outside
        //--------------------------------------------------

        translate([
            labyrinth_margin - lid_clearance,
            labyrinth_margin - lid_clearance,
            lid_thickness
        ])

        hull()
        {

            corner(
                corner_radius,
                corner_radius,
                labyrinth_height
            );

            corner(
                outside_length -
                (2 * (labyrinth_margin - lid_clearance)) -
                corner_radius,

                corner_radius,

                labyrinth_height
            );

            corner(
                outside_length -
                (2 * (labyrinth_margin - lid_clearance)) -
                corner_radius,

                outside_width -
                (2 * (labyrinth_margin - lid_clearance)) -
                corner_radius,

                labyrinth_height
            );

            corner(
                corner_radius,

                outside_width -
                (2 * (labyrinth_margin - lid_clearance)) -
                corner_radius,

                labyrinth_height
            );

        }


        //--------------------------------------------------
        // Inside cavity
        //--------------------------------------------------

        translate([
            labyrinth_margin + labyrinth_thickness - lid_clearance,
            labyrinth_margin + labyrinth_thickness - lid_clearance,
            lid_thickness - 1
        ])

        hull()
        {

            corner(
                corner_radius,
                corner_radius,
                labyrinth_height + 2
            );

            corner(
                outside_length -
                (2 * (labyrinth_margin + labyrinth_thickness - lid_clearance)) -
                corner_radius,

                corner_radius,

                labyrinth_height + 2
            );

            corner(
                outside_length -
                (2 * (labyrinth_margin + labyrinth_thickness - lid_clearance)) -
                corner_radius,

                outside_width -
                (2 * (labyrinth_margin + labyrinth_thickness - lid_clearance)) -
                corner_radius,

                labyrinth_height + 2
            );

            corner(
                corner_radius,

                outside_width -
                (2 * (labyrinth_margin + labyrinth_thickness - lid_clearance)) -
                corner_radius,

                labyrinth_height + 2
            );

        }

    }

}

//--------------------------------------------------
// Labyrinth post clearances
//--------------------------------------------------

module labyrinth_post_clearance()
{

    post_center =
        wall_thickness +
        (screw_post_diameter / 2) -
        screw_post_corner_overlap;

    clearance_depth =
        labyrinth_height + 2;


    // Top left

    translate([
        post_center - (post_clearance / 2),
        post_center - (post_clearance / 2),
        lid_thickness 
    ])
    cube([
        post_clearance,
        post_clearance,
        clearance_depth
    ]);


    // Top right

    translate([
        outside_length - post_center - (post_clearance / 2),
        post_center - (post_clearance / 2),
        lid_thickness
    ])
    cube([
        post_clearance,
        post_clearance,
        clearance_depth
    ]);


    // Bottom right

    translate([
        outside_length - post_center - (post_clearance / 2),
        outside_width - post_center - (post_clearance / 2),
        lid_thickness
    ])
    cube([
        post_clearance,
        post_clearance,
        clearance_depth
    ]);


    // Bottom left

    translate([
        post_center - (post_clearance / 2),
        outside_width - post_center - (post_clearance / 2),
        lid_thickness 
    ])
    cube([
        post_clearance,
        post_clearance,
        clearance_depth
    ]);

}

//--------------------------------------------------
// Screw holes
//--------------------------------------------------

module screw_holes()
{

    post_center =
        wall_thickness +
        (screw_post_diameter / 2) -
        screw_post_corner_overlap;

    hole_depth =
        lid_thickness +
        labyrinth_height +
        2;


    // Top left

    translate([
        post_center,
        post_center,
        -1
    ])

    cylinder(
        h = hole_depth,
        d = lid_screw_hole_diameter
    );


    // Top right

    translate([
        outside_length - post_center,
        post_center,
        -1
    ])

    cylinder(
        h = hole_depth,
        d = lid_screw_hole_diameter
    );


    // Bottom right

    translate([
        outside_length - post_center,
        outside_width - post_center,
        -1
    ])

    cylinder(
        h = hole_depth,
        d = lid_screw_hole_diameter
    );


    // Bottom left

    translate([
        post_center,
        outside_width - post_center,
        -1
    ])

    cylinder(
        h = hole_depth,
        d = lid_screw_hole_diameter
    );

}



//--------------------------------------------------
// RJ45 slot
//--------------------------------------------------

module rj45_slot()
{

    translate([
        cable_x+7, //Do not fall onder the blockske
        cable_y,
        -1
    ])

    hull()
    {

        translate([-6,0,0])

            cylinder(
                h = lid_thickness + 2,
                d = 10,
                $fn = 32
            );

        translate([6,0,0])

            cylinder(
                h = lid_thickness + 2,
                d = 10,
                $fn = 32
            );

    }

}



//--------------------------------------------------
// LED window
//--------------------------------------------------

module led_window()
{

    // TODO

}



//--------------------------------------------------
// Vent holes
//--------------------------------------------------

module vent_holes()
{

    // TODO

}



//=====================================================================
// MAIN ASSEMBLY
//=====================================================================
module lid()
{
    difference()
    {

        union()
        {

            lid_plate();

            labyrinth();

            //--------------------------------------------------
            // Cable clamp
            //--------------------------------------------------

            translate([
                cable_x - clamp_width/2,
                cable_y - clamp_length/2,
                lid_thickness
            ])
            rotate([0,0,cable_rotation])
                cable_clamp(true);

        }


        //--------------------------------------------------
        // Things to subtract
        //--------------------------------------------------

        screw_holes();

        rj45_slot();

        led_window();

        vent_holes();

        labyrinth_post_clearance();

    }

}
lid();