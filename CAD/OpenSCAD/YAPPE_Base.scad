//=====================================================================
// YAPPE
// Base 
//
// Project : YAPPE
// File    : YAPPE_Base.scad
// Author  : Björn Verbruggen
//
// Description
// ------------
// YAPPE is Yet Another Pump Placement Element.
// YAPPE is designed for the Ubbink Air 100 indoor air pump.
// YAPPE allows inexpensive indoor air pumps to survive outdoor use. Because buying a proper outdoor pump would be far too sensible.
// YAPPE helps your pump survive Belgian Summer humidity ;)
// 
// Separate printable parts:
// - base/inner box (this file)
// - lid/outer box
// - feet
//
// Model philosophy
// ----------------
// 1. Reuse previous created parts.
// 2. Only add air grid and pump support in base.
// 3. Printable in PETG/ABS/ASA; shoult fit Prusa Mini+ or Bambu X1C
// 4. KISS+: design contains only logic where needed, calibration is done manually.
// 
//
// Version
// -------
// YAPPE 0.1
//=====================================================================

//=====================================================================
// PARAMETERS
//=====================================================================


//--------------------------------------------------
// Internal dimensions
//--------------------------------------------------

inside_length = 100;      // mm
inside_width  = 150;      // mm
inside_height = 60;       // mm


//--------------------------------------------------
// Wall dimensions
//--------------------------------------------------

wall_thickness  = 3;      // mm
floor_thickness = 4;      // mm


//--------------------------------------------------
// Corner radius
//--------------------------------------------------

corner_radius = 8;        // mm


//--------------------------------------------------
// Boolean operations
//--------------------------------------------------

boolean_overlap = 1;      // mm




//--------------------------------------------------
// Rendering
//--------------------------------------------------

preview_fn = 24;
render_fn  = 128;

$fn = render_fn;




//=====================================================================
// DERIVED DIMENSIONS
//=====================================================================


//--------------------------------------------------
// Enclosure
//--------------------------------------------------

outside_length =
    inside_length +
    (wall_thickness * 2);

outside_width =
    inside_width +
    (wall_thickness * 2);

outside_height =
    inside_height +
    floor_thickness;





//=====================================================================
// MODULES
//=====================================================================


//--------------------------------------------------
// Corner
//--------------------------------------------------

module corner(x, y, height)
{

    translate([x, y, 0])
    {

        cylinder(
            h = height,
            r = corner_radius
        );

    }

}


//--------------------------------------------------
// Shell
//--------------------------------------------------

module shell()
{

    hull()
    {

        corner(
            corner_radius,
            corner_radius,
            outside_height
        );

        corner(
            outside_length - corner_radius,
            corner_radius,
            outside_height
        );

        corner(
            outside_length - corner_radius,
            outside_width - corner_radius,
            outside_height
        );

        corner(
            corner_radius,
            outside_width - corner_radius,
            outside_height
        );

    }

}



//--------------------------------------------------
// Cavity
//--------------------------------------------------

module cavity()
{

    translate([
        wall_thickness,
        wall_thickness,
        floor_thickness
    ])
    {

        hull()
        {

            corner(
                corner_radius,
                corner_radius,
                inside_height + boolean_overlap
            );

            corner(
                inside_length - corner_radius,
                corner_radius,
                inside_height + boolean_overlap
            );

            corner(
                inside_length - corner_radius,
                inside_width - corner_radius,
                inside_height + boolean_overlap
            );

            corner(
                corner_radius,
                inside_width - corner_radius,
                inside_height + boolean_overlap
            );

        }

    }

}




//=====================================================================
// MAIN ASSEMBLY
//=====================================================================

module base()
{
    difference()
    {
        //--------------------------------------------------
        // Complete geometry
        //--------------------------------------------------

        union()
        {
            //----------------------------------
            // Enclosure shell
            //----------------------------------

            difference()
            {
                shell();
                cavity();
            }

            //----------------------------------
            // Internal structures
            //----------------------------------





    }
}
}
base();
