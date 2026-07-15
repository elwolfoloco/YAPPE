//=====================================================================
// hose_slot.scad
//
// Rounded hose slot.
//
// Origin:
//   X = centre of slot
//   Y = centre of slot
//   Z = bottom
//
//=====================================================================


//--------------------------------------------------
// Hose slot
//--------------------------------------------------

module hose_slot(
    slot_height,
    slot_width,
    wall_thickness
)
{
    rotate([90,0,0])

    hull()
    {
        translate([
            0,
            -(slot_height / 2) + (slot_width / 2),
            0
        ])

        cylinder(
            d = slot_width,
            h = wall_thickness
        );


        translate([
            0,
             (slot_height / 2) - (slot_width / 2),
            0
        ])

        cylinder(
            d = slot_width,
            h = wall_thickness
        );
    }
}