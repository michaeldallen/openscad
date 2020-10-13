$fn = 25;

roundcorner = 2; 

color("blue") minkowski() {
    cube([25.5 - roundcorner + 6, 25.5 - roundcorner + 6, 10 - roundcorner], center = true);
    sphere(d = roundcorner);
}

//translate([1, 1, 1])  
cube([15.5, 25.5, 9], center = true);

translate([(-12.75 - 20), 12.75, 0]) 
rotate([90, 0, 0]) {
    color("red") rotate_extrude(angle=80) {
        translate([20, 0]) {
           circle(d=6);
        }
    }
}

translate([(-12.75 - 20), -12.75, 0]) 
rotate([90, 0, 0]) {
    color("red") rotate_extrude(angle=80) {
        translate([20, 0]) {
           circle(d=6);
        }
    }
}