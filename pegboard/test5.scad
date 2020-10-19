$fn = 25;

roundcorner = 2; 

horn_arc = 70;

color("blue") minkowski() {
    cube([(25.5 / 2) - roundcorner + 6, 25.5 - roundcorner + 6, 5 - roundcorner], center = true);
    sphere(d = roundcorner);
}

// translate([1, 1, 1])  cube([15.5, 25.5, 9], center = true);

translate([(-25.5 / 4) - 10, 12.75, 0]) {
    rotate([90, 0, 0]) {
        color("red") rotate_extrude(angle=horn_arc) {
            translate([10, 0]) {
                circle(d=6);
            }
        }
    }
}


translate([(-25.5 / 4) - 10, -12.75, 0]) {
    rotate([90, 0, 0]) {
        color("red") rotate_extrude(angle=horn_arc) {
            translate([10, 0]) {
                circle(d=6);
            }
        }
    }
}