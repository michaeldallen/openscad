/*

cube([100, 10, 10]);
intersection() {
  translate([100, (10 - sqrt(200)) / 2, 0]) {
    rotate([0, 0, 45]) color("purple") cube(10);
  }
  translate([100, 0, 0]) color("pink") cube([110, 10, 10]);
}
translate([0, -30, 0]) cube([10, 10, 10]);

translate([0, -10, 0]) difference () { 
    cylinder(10,20, 20);
    color("red")    cylinder(10,10, 10);
    color("blue") translate([0, -20, 0]) cube([20,30,10]);
}
*/


/*
translate([0, 25, 0]) {    
    $fn = 25;
    color("purple") minkowski() {
        
        cube(5);
        translate([2.5, 2.5, 2.5]) sphere(d=5);

    }
}
*/

translate([0, -50, 0]){
        $fn = 25;

    minkowski() {
        cube([100, 5, 5]);
        translate([2.5, 2.5, 2.5]) sphere(d=5);
    }        
    minkowski() {
        translate([0, -10, 0]) difference () { 
            cylinder(5,15, 15);
            color("red")    cylinder(10,10, 10);
            color("blue") translate([0, -20, 0]) cube([20,30,10]);
        }
        translate([2.5, 2.5, 2.5]) sphere(d=5);
    }


}
