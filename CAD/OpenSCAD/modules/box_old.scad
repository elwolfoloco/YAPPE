//=====================================================================
// box.scad
//
// Generic rounded box geometry
//
// Creates an open box with rounded corners.
// No holes, no bridges, no project-specific features.
//
// YAPPE Project
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
            corner_radius,
            corner_radius,
            outside_height,
            corner_radius
        );

        corner(
            outside_length - corner_radius,
            corner_radius,
            outside_height,
            corner_radius
        );

        corner(
            outside_length - corner_radius,
            outside_width - corner_radius,
            outside_height,
            corner_radius
        );

        corner(
            corner_radius,
            outside_width - corner_radius,
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
        wall_thickness,
        wall_thickness,
        bottom_thickness
    ])

    hull()
    {
        corner(
            corner_radius,
            corner_radius,
            inside_height + boolean_overlap,
            corner_radius
        );

        corner(
            inside_length - corner_radius,
            corner_radius,
            inside_height + boolean_overlap,
            corner_radius
        );

        corner(
            inside_length - corner_radius,
            inside_width - corner_radius,
            inside_height + boolean_overlap,
            corner_radius
        );

        corner(
            corner_radius,
            inside_width - corner_radius,
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