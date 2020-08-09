
$fn = 26;

minkowski() {
    union() {
        cube([130, 5, 5]);
        translate([0, -10, 0]) difference () { 
            cylinder(5,15, 15);
            color("red")    cylinder(10,10, 10);
            color("blue") translate([0, -20, 0]) cube([20,30,10]);
        }
        translate([0, -25, 0]) cube([30,5,5]);
        translate([130, -10, 00]) difference () { 
            cylinder(5,15, 15);
            color("red")    cylinder(10,10, 10);
            color("blue") translate([-20, -20, 0]) cube([20,30,10]);
        }
        translate([100, -25, 0]) cube([30,5,5]);
    }
//    translate([2.5, 2.5, 2.5]) sphere(d=5);
}



