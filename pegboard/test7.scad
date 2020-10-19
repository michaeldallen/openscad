$fn = 25;

roundcorner = 2; 

horn_arc = 70;
minkowski() {
union() {
translate([-1.5, 0, 0]) 
color("blue") 
    cube([(25.5 / 2) - roundcorner + 3 , 25.5 - roundcorner + 6, 5 - roundcorner], center = true);


translate([-1.5, 0, -2.5]) 
color("blue") 
    cube([(25.5 / 2) - roundcorner + 3 , 25.5 - roundcorner + 6, 5 - roundcorner], center = true);



translate([-3, 0, -5]) {
    color("purple") 
        cube([(25.5 / 2) - roundcorner + 6, 25.5 - roundcorner + 6 + 6, 5 - roundcorner], center = true);
    
}
}
sphere(d = roundcorner);
}


translate([(-25.5 / 4) - 10, 12.75, 1.25]) {
    rotate([90, 0, 0]) {
        color("red") rotate_extrude(angle=horn_arc, $fn = 100) {
            translate([10, 0]) {
                circle(d=6);
            }
        }
    }
}


translate([(-25.5 / 4) - 10, -12.75, 1.25]) {
    rotate([90, 0, 0]) {
        color("red") rotate_extrude(angle=horn_arc, $fn = 100) {
            translate([10, 0]) {
                circle(d=6);
            }
        }
    }
}


