//=====================================================================
// BlitzBox
//
// CableGuide.scad
//
// Cable guide for H-Field UTP cable
//=====================================================================


//--------------------------------------------------
// Dimensions
//--------------------------------------------------

guide_length = 50;
guide_width  = 24;
guide_height = 16;

v_depth = 8;

cable_diameter = 7;
cable_radius   = cable_diameter / 2;

side_channel_y = guide_length - 8;


//=====================================================================
// Cable guide
//=====================================================================

module cable_guide()
{

    difference()
    {

        //--------------------------------------------------
        // Base block
        //--------------------------------------------------

        cube([
            guide_width,
            guide_length,
            guide_height
        ]);


       //--------------------------------------------------
// Top V groove
//--------------------------------------------------

translate([
    guide_width / 2,
    guide_length + 1,
    guide_height
])

rotate([90,0,0])

cylinder(
    h = guide_length + 2,
    r = v_depth,
    $fn = 4
);


//--------------------------------------------------
// Vertical cable channel
//--------------------------------------------------

translate([
    guide_width / 2,
    guide_length - 1,
    -1
])

cylinder(
    h = guide_height + 2,
    r = cable_radius,
    $fn = 48
);

    }

}


cable_guide();