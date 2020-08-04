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
