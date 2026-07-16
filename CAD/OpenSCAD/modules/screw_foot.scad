//--------------------------------------------------
// Screw foot
//
// Tapered foot with M3 clearance hole.
//
//--------------------------------------------------

inside_height = 40;
screw_post_diameter = 25;
boolean_overlap = 1;
screw_hole_diameter = 2.8;
module screw_foot()
{
    difference()
    {
        //--------------------------------------------------
        // Main body
        //--------------------------------------------------

        cylinder(
            h = inside_height,
            d1 = screw_post_diameter,      // top
            d2 = 4                         // bottom
        );


        //--------------------------------------------------
        // Centre hole
        //--------------------------------------------------

        translate([0,0,-boolean_overlap])

        cylinder(
            h = inside_height + (2 * boolean_overlap),
            d = screw_hole_diameter
        );
    }
}
screw_foot();