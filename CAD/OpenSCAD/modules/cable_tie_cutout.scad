//--------------------------------------------------
// Cable tie cutout
//--------------------------------------------------

module cable_tie_cutout(
    length,
    width,
    height
)
{
    translate([
        -length / 2,
        -width / 2,
        0
    ])
    cube([
        length,
        width,
        height
    ]);
}