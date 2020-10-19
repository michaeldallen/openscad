//fine = true; 
fine = false; 

$fn = fine ? 100 : 25;

roundcorner = 2; 

horn_arc = 45;

horn_diameter = 5;

minkowski() {
    union() {
        translate([-1.5, 0, 0]) {
            cube([(25.5 / 2) - roundcorner + 3 , 25.5 - roundcorner + 6, 5 - roundcorner], center = true);
        }
        translate([-1.5, 0, -2.5]) {
            cube([(25.5 / 2) - roundcorner + 3 , 25.5 - roundcorner + 6, 5 - roundcorner], center = true);
        }
        translate([0, 0, -5]) {
            cube([(25.5 / 2) - roundcorner + 6, 25.5 - roundcorner + 6 + 6, 5 - roundcorner], center = true);
        }
    }
    sphere(d = roundcorner);
}

/*
translate([(-25.5 / 4) - 10, 12.75, 1.25]) {
    rotate([90, 0, 0]) {
        color("red") rotate_extrude(angle=horn_arc, $fn = 25) {
            translate([10, 0]) {
                circle(d=6);
            }
        }
    }
}

*/





translate([10 + (25.5 / 4) -3, -12.5, 1.25]) {
    rotate([270, -45, 180]) {
        color("red") union() {
            rotate_extrude(angle=horn_arc) {
                translate([10, 0]) {
                    circle(d = horn_diameter);
                }
            }
            translate([10,0, 0]) {
                color("purple") sphere(d = horn_diameter);
            }
        }
    }
}



translate([10 + (25.5 / 4) -3, 12.75, 1.25]) {
    rotate([270, -45, 180]) {
        color("red") union() {
            rotate_extrude(angle=horn_arc) {
                translate([10, 0]) {
                    circle(d = horn_diameter);
                }
            }
            translate([10,0, 0]) {
                color("purple") sphere(d = horn_diameter);
            }
        }
    }
}
