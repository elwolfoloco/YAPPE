//=====================================================================
// YAPPE
// InnerBox
//=====================================================================

include <YAPPE_Parameters.scad>

use <Modules/box.scad>
use <Modules/bridge.scad>

use <Modules/pump_mount_pattern.scad>
use <Modules/rain_grid.scad>

use <Modules/cable_slot.scad>
use <Modules/hose_slot.scad>


//=====================================================================
// INNER BOX
//=====================================================================

module inner_box()
{
    difference()
    {
        //--------------------------------------------------
        // Positive geometry
        //--------------------------------------------------

        union()
        {
            //----------------------------------
            // Box
            //----------------------------------

            box(
                bottom_length,
                bottom_width,
                bottom_thickness,

                wall_height / 1.5,   // ze wall alignz ze top - so there iz no need to match ze height of ze pump
                wall_thickness,

                bottom_flange,

                corner_radius
            );


            //----------------------------------
            // Bridge 1
            //----------------------------------

            translate([
                0,
                -21.5,
                bottom_thickness
            ])

            bridge(
                bridge_length,
                bridge_width,
                bridge_height
            );


            //----------------------------------
            // Bridge 2
            //----------------------------------

            translate([
                0,
                 21.5,
                bottom_thickness
            ])

            bridge(
                bridge_length,
                bridge_width,
                bridge_height
            );
        }


        //--------------------------------------------------
        // Pump mounting pattern
        //--------------------------------------------------

        translate([
            0,
            0,
            -88.9
        ])

        pump_mount_pattern(
            71,
            43,

            3.2,
            6.5,

            100,
            2.5
        );


        //--------------------------------------------------
        // Rain grid
        //--------------------------------------------------
		translate([0,0,-1])  // kreate ze kut trough ze bottom 
        rain_grid(
            115,
            45,
            18,
            100
        );


        //--------------------------------------------------
        // Cable slot
        //--------------------------------------------------

        translate([
            -(bottom_length / 2),
            0,
            wall_height - 15
        ])

        rotate([0,0,90])

        cable_slot(
            50,
            8,
            20
        );


        //--------------------------------------------------
        // Hose slot
        //--------------------------------------------------

        translate([
             (bottom_length / 2) - 10,
            0,
            wall_height - 15
        ])

        rotate([0,0,90])

        hose_slot(
            50,
            12,
            20
        );
    }
}


//=====================================================================
// Render
//=====================================================================

inner_box();