//=====================================================================
// BlitzBox
//
// CableClamp.scad
//
// Split cable clamp
//
// Author: Björn Verbruggen
//=====================================================================



//=====================================================================
// PARAMETERS
//=====================================================================

//--------------------------------------------------
// Block
//--------------------------------------------------

clamp_width  = 20;
clamp_length = 18;
clamp_height = 16;


//--------------------------------------------------
// Cable
//--------------------------------------------------

cable_diameter = 6.0;
cable_radius   = cable_diameter / 2;


//--------------------------------------------------
// M3
//--------------------------------------------------

m3_fixed_hole     = 2.8;
m3_clearance_hole = 3.4;

screw_offset = 3;


//--------------------------------------------------
// Boolean overlap
//--------------------------------------------------

boolean_overlap = 0.1;



//=====================================================================
// COMPLETE BLOCK
//=====================================================================

module clamp_body(fixed = true)
{

    difference()
    {

        //--------------------------------------------------
        // Block
        //--------------------------------------------------

        cube([
            clamp_width,
            clamp_length,
            clamp_height
        ]);


        //--------------------------------------------------
        // Cable hole (vertical)
        //--------------------------------------------------

        translate([
            clamp_width / 2,
            clamp_length / 2,
            -1
        ])

        cylinder(
            h = clamp_height + 2,
            r = cable_radius,
            $fn = 64
        );


        //--------------------------------------------------
        // Left M3
        //--------------------------------------------------

        translate([
            -1,
            screw_offset,
            clamp_height * 0.6
        ])

        rotate([0,90,0])

        cylinder(
            h = clamp_width + 2,
            d = fixed ? m3_fixed_hole : m3_clearance_hole,
            $fn = 48
        );


        //--------------------------------------------------
        // Right M3
        //--------------------------------------------------

        translate([
            -1,
            clamp_length - screw_offset,
            clamp_height * 0.6
        ])

        rotate([0,90,0])

        cylinder(
            h = clamp_width + 2,
            d = fixed ? m3_fixed_hole : m3_clearance_hole,
            $fn = 48
        );

    }

}



//=====================================================================
// HALF CLAMP
//=====================================================================

module cable_clamp(fixed = true)
{

    intersection()
    {

        clamp_body(fixed);

        if (fixed)
        {

            translate([
                -boolean_overlap,
                0,
                0
            ])

            cube([
                (clamp_width / 2) + boolean_overlap,
                clamp_length,
                clamp_height
            ]);

        }
        else
        {

            translate([
                clamp_width / 2,
                0,
                0
            ])

            cube([
                (clamp_width / 2) + boolean_overlap,
                clamp_length,
                clamp_height
            ]);

        }

    }

}



//=====================================================================
// TEST
//=====================================================================

translate([0,0,0])
    cable_clamp(true);

translate([30,0,0])
    cable_clamp(false);