// https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_1
// Michael Allen 2020.08.29


$fa = 1;
$fs = 0.4;

cube([60, 20, 10], center=true);
translate([0, 0, 10]) {
     cube([30, 20, 10], center=true);
}

rotate([90, 0, 0]) {
     // front
     translate([-20, 0, -15]) {
	  cylinder(h=3, r=8, center=true);
     }
     translate([-20, 0,  15]) {
	  cylinder(h=3, r=8, center=true);
     }
     translate([-20, 0, 0]) {
	  cylinder(h=30, r=2, center=true);
     }

     
     //back
     translate([20, 0, -15]) {
	  cylinder(h=3, r=8, center=true);
     }
     translate([20, 0,  15]) {
	  cylinder(h=3, r=8, center=true);
     }
     translate([20, 0, 0]) {
	  cylinder(h=30, r=2, center=true);
     }

}


