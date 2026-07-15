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
// Outside shell
//--------------------------------------------------

module shell(
    outside_length,
    outside_width,
    outside_height,
    corner_radius
)
{
    hull()
    {
        corner(
            -(outside_length / 2) + corner_radius,
            -(outside_width / 2) + corner_radius,
            outside_height,
            corner_radius
        );

        corner(
             (outside_length / 2) - corner_radius,
            -(outside_width / 2) + corner_radius,
            outside_height,
            corner_radius
        );

        corner(
             (outside_length / 2) - corner_radius,
             (outside_width / 2) - corner_radius,
            outside_height,
            corner_radius
        );

        corner(
            -(outside_length / 2) + corner_radius,
             (outside_width / 2) - corner_radius,
            outside_height,
            corner_radius
        );
    }
}


//--------------------------------------------------
// Inside cavity
//--------------------------------------------------

module cavity(
    inside_length,
    inside_width,
    inside_height,
    wall_thickness,
    bottom_thickness,
    corner_radius,
    boolean_overlap = 1
)
{
    translate([
        0,
        0,
        bottom_thickness
    ])

    hull()
    {
        corner(
            -(inside_length / 2) + corner_radius,
            -(inside_width / 2) + corner_radius,
            inside_height + boolean_overlap,
            corner_radius
        );

        corner(
             (inside_length / 2) - corner_radius,
            -(inside_width / 2) + corner_radius,
            inside_height + boolean_overlap,
            corner_radius
        );

        corner(
             (inside_length / 2) - corner_radius,
             (inside_width / 2) - corner_radius,
            inside_height + boolean_overlap,
            corner_radius
        );

        corner(
            -(inside_length / 2) + corner_radius,
             (inside_width / 2) - corner_radius,
            inside_height + boolean_overlap,
            corner_radius
        );
    }
}


//--------------------------------------------------
// Rounded box
//--------------------------------------------------

module box(
    inside_length,
    inside_width,
    inside_height,

    wall_thickness,
    bottom_thickness,

    corner_radius,

    boolean_overlap = 1
)
{
    outside_length =
        inside_length +
        (2 * wall_thickness);

    outside_width =
        inside_width +
        (2 * wall_thickness);

    outside_height =
        inside_height +
        bottom_thickness;

    difference()
    {
        shell(
            outside_length,
            outside_width,
            outside_height,
            corner_radius
        );

        cavity(
            inside_length,
            inside_width,
            inside_height,
            wall_thickness,
            bottom_thickness,
            corner_radius,
            boolean_overlap
        );
    }
}