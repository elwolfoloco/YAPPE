//=====================================================================
// box.scad
//
// Generic rounded box
//
// Origin:
//   X = centre
//   Y = centre
//   Z = bottom
//
//=====================================================================


//--------------------------------------------------
// Rounded corner
//--------------------------------------------------

module corner(x, y, height, radius)
{
    translate([x, y, 0])
        cylinder(
            h = height,
            r = radius
        );
}


//--------------------------------------------------
// Bottom plate
//--------------------------------------------------

module bottom(
    bottom_length,
    bottom_width,
    bottom_thickness,
    corner_radius
)
{
    hull()
    {
        corner(
            -(bottom_length / 2) + corner_radius,
            -(bottom_width / 2) + corner_radius,
            bottom_thickness,
            corner_radius
        );

        corner(
             (bottom_length / 2) - corner_radius,
            -(bottom_width / 2) + corner_radius,
            bottom_thickness,
            corner_radius
        );

        corner(
             (bottom_length / 2) - corner_radius,
             (bottom_width / 2) - corner_radius,
            bottom_thickness,
            corner_radius
        );

        corner(
            -(bottom_length / 2) + corner_radius,
             (bottom_width / 2) - corner_radius,
            bottom_thickness,
            corner_radius
        );
    }
}


//--------------------------------------------------
// Wall
//--------------------------------------------------

module wall(
    bottom_length,
    bottom_width,

    bottom_thickness,

    wall_height,
    wall_thickness,

    bottom_flange,

    corner_radius
)
{
    wall_length =
        bottom_length -
        (2 * bottom_flange);

    wall_width =
        bottom_width -
        (2 * bottom_flange);

    difference()
    {
        //--------------------------------------------------
        // Outside
        //--------------------------------------------------

        translate([0,0,bottom_thickness])

        hull()
        {
            corner(
                -(wall_length / 2) + corner_radius,
                -(wall_width / 2) + corner_radius,
                wall_height,
                corner_radius
            );

            corner(
                 (wall_length / 2) - corner_radius,
                -(wall_width / 2) + corner_radius,
                wall_height,
                corner_radius
            );

            corner(
                 (wall_length / 2) - corner_radius,
                 (wall_width / 2) - corner_radius,
                wall_height,
                corner_radius
            );

            corner(
                -(wall_length / 2) + corner_radius,
                 (wall_width / 2) - corner_radius,
                wall_height,
                corner_radius
            );
        }


        //--------------------------------------------------
        // Cavity
        //--------------------------------------------------

        translate([0,0,bottom_thickness])

        hull()
        {
            corner(
                -(wall_length / 2) + corner_radius + wall_thickness,
                -(wall_width / 2) + corner_radius + wall_thickness,
                wall_height + 1,
                corner_radius
            );

            corner(
                 (wall_length / 2) - corner_radius - wall_thickness,
                -(wall_width / 2) + corner_radius + wall_thickness,
                wall_height + 1,
                corner_radius
            );

            corner(
                 (wall_length / 2) - corner_radius - wall_thickness,
                 (wall_width / 2) - corner_radius - wall_thickness,
                wall_height + 1,
                corner_radius
            );

            corner(
                -(wall_length / 2) + corner_radius + wall_thickness,
                 (wall_width / 2) - corner_radius - wall_thickness,
                wall_height + 1,
                corner_radius
            );
        }
    }
}


//--------------------------------------------------
// Complete box
//--------------------------------------------------

module box(
    bottom_length,
    bottom_width,
    bottom_thickness,

    wall_height,
    wall_thickness,

    bottom_flange,

    corner_radius
)
{
    union()
    {
        bottom(
            bottom_length,
            bottom_width,
            bottom_thickness,
            corner_radius
        );

        wall(
            bottom_length,
            bottom_width,

            bottom_thickness,

            wall_height,
            wall_thickness,

            bottom_flange,

            corner_radius
        );
    }
}

//box();