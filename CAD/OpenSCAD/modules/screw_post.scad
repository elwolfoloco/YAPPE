//--------------------------------------------------
// Screw post
//
// Creates one screw post with a central hole.
//
//--------------------------------------------------

module screw_post()
{

    difference()
    {

        // Main body

        cylinder(
            h = inside_height,
            d = screw_post_diameter
        );


        // Centre hole

        translate([0, 0, -boolean_overlap])
        {

            cylinder(
                h = inside_height + (2 * boolean_overlap),
                d = screw_hole_diameter
            );

        }

    }

}
