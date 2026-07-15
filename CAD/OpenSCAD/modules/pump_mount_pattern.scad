//=====================================================================
// pump_mount_pattern.scad
//
// Pump mounting hole pattern.
//
// Creates four M3 clearance holes with a counterbore for the screw head.
//
// Origin:
//   X = centre of pattern
//   Y = centre of pattern
//   Z = bottom
//
//=====================================================================


//--------------------------------------------------
// Mounting pattern
//--------------------------------------------------

module pump_mount_pattern(
    hole_spacing_x,
    hole_spacing_y,

    hole_diameter,
    head_diameter,

    hole_height,
    head_depth
)
{
    x = hole_spacing_x / 2;
    y = hole_spacing_y / 2;

    //--------------------------------------------------
    // Bottom left
    //--------------------------------------------------

    translate([-x, -y, 0])
    {
        cylinder(
            d = hole_diameter,
            h = hole_height
        );

        translate([0,0,hole_height-head_depth])
        cylinder(
            d = head_diameter,
            h = head_depth + 1
        );
    }


    //--------------------------------------------------
    // Bottom right
    //--------------------------------------------------

    translate([x, -y, 0])
    {
        cylinder(
            d = hole_diameter,
            h = hole_height
        );

        translate([0,0,hole_height-head_depth])
        cylinder(
            d = head_diameter,
            h = head_depth + 1
        );
    }


    //--------------------------------------------------
    // Top left
    //--------------------------------------------------

    translate([-x, y, 0])
    {
        cylinder(
            d = hole_diameter,
            h = hole_height
        );

        translate([0,0,hole_height-head_depth])
        cylinder(
            d = head_diameter,
            h = head_depth + 1
        );
    }


    //--------------------------------------------------
    // Top right
    //--------------------------------------------------

    translate([x, y, 0])
    {
        cylinder(
            d = hole_diameter,
            h = hole_height
        );

        translate([0,0,hole_height-head_depth])
        cylinder(
            d = head_diameter,
            h = head_depth + 1
        );
    }
}