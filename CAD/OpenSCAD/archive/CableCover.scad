//==================================================
// CableCover
//==================================================

cover_length = 50;
cover_width  = 24;

cover_height = 16;
cover_wall   = 2;



module cable_cover()
{

    difference()
    {

        //--------------------------------------------------
        // Outer
        //--------------------------------------------------

        cube([
            cover_width,
            cover_length,
            cover_height
        ]);


        //--------------------------------------------------
        // Hollow
        //--------------------------------------------------

        translate([
            cover_wall,
            cover_wall,
            cover_wall
        ])

        cube([
            cover_width  - (2*cover_wall),
            cover_length - cover_wall+1,
            cover_height
        ]);

    }

}
cable_cover();
