//=====================================================================
// rain_grid.scad
//
// Rain / air inlet pattern.
//
// Creates two elongated openings.
//
// Origin:
//   X = centre
//   Y = centre
//   Z = bottom
//
//=====================================================================


//--------------------------------------------------
// Rounded slot
//--------------------------------------------------

module rounded_slot(
    length,
    width,
    height
)
{
    hull()
    {
        translate([
            0,
            -(length / 2) + (width / 2),
            0
        ])
        cylinder(
            d = width,
            h = height
        );

        translate([
            0,
             (length / 2) - (width / 2),
            0
        ])
        cylinder(
            d = width,
            h = height
        );
    }
}


//--------------------------------------------------
// Rain grid
//--------------------------------------------------

module rain_grid(
    spacing,
    slot_length,
    slot_width,
    slot_height
)
{
    //--------------------------------------------------
    // Left opening
    //--------------------------------------------------

    translate([
        -spacing / 2,
        0,
        0
    ])

    rounded_slot(
        slot_length,
        slot_width,
        slot_height
    );


    //--------------------------------------------------
    // Right opening
    //--------------------------------------------------

    translate([
         spacing / 2,
         0,
         0
    ])

    rounded_slot(
        slot_length,
        slot_width,
        slot_height
    );
}