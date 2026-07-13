//==================================================
// Test - Rounded Bottom Edge
//==================================================


//--------------------------------------------------
// Parameters
//--------------------------------------------------

length = 120;
width  = 80;
height = 40;

corner_radius = 10;
bottom_radius = 2;

preview_fn = 24;
render_fn  = 64;

$fn = preview_fn;


//--------------------------------------------------
// Rounded rectangle
//--------------------------------------------------

module rounded_rectangle(l,w,r)
{

    hull()
    {

        translate([r,r])
            circle(r);

        translate([l-r,r])
            circle(r);

        translate([l-r,w-r])
            circle(r);

        translate([r,w-r])
            circle(r);

    }

}


//--------------------------------------------------
// Test object
//--------------------------------------------------

module test_box()
{

    union()
    {

        //--------------------------------------------------
        // Bottom rounded section
        //--------------------------------------------------

        linear_extrude(height = bottom_radius, scale = 1.03)
            rounded_rectangle(length,width,corner_radius);


        //--------------------------------------------------
        // Straight wall
        //--------------------------------------------------

        translate([0,0,bottom_radius])

        linear_extrude(height = height-bottom_radius)
            rounded_rectangle(length,width,corner_radius);

    }

}


test_box();
