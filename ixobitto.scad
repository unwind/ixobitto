//
// My first OpenSCAD project: trying to model something that'd fit the
// bit holder of the (toy) Ixolito electric screwdriver.
//
// Created March 2018 by Emil Brink <emil@obsession.se>.
//

// Don't change this, it should be the proper shape to fit the tool.
coneHeight = 4.3;
thinHeight = 0.7;
thickHeight = 1.0;
squareHeight = 4.0;

module hexSocket(radius = 5, wt = 1, h = 50, depth = 2) {
    old_fn = $fn;
    difference() {
        cylinder(h, r1 = radius  + wt, r2 = radius + wt, $fn = old_fn);
        translate([0, 0, depth]) {
          cylinder(h - depth, r1 = radius, r2 = radius, $fn = 6);
        }
    }
    $fn = 6;
}

module squareShaft(r = 10, h = 50) {
    old_fn = $fn;
    cylinder(h, r1 = r, r2 = r, $fn = 4);
    $fn = old_fn;
}

cylinder(h = coneHeight, r1 = 1, r2 = 6);
translate([0, 0, coneHeight]) {
    cylinder(h = thinHeight, r1 = 4, r2 = 4);
    translate([0, 0, thinHeight]) {
        cylinder(h = thickHeight, r1 = 5.1, r2 = 5.1);
        translate([0, 0, thickHeight]) {
            squareShaft(r = 3.25, h = squareHeight);
            translate([0, 0, squareHeight]) {
                hexSocket();
            }
        }
    }
}
