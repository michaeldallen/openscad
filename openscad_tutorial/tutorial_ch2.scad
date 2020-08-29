// https://en.wikibooks.org/wiki/OpenSCAD_Tutorial/Chapter_2
// Michael Allen 2020.08.29


$fa = 1;
$fs = 0.4;

fudge = 0.001;


wheel_radius = 8;
wheel_width = 10;

base_height = 5;
top_height = 8;

body_roll = -3;
wheels_turn = -15;

track = 34;

scale([1,1,1]) {

     // body
     rotate([body_roll, 0, 0]) {
	  scale([1.2, 1, 1]) {
	       //base
	       cube([60, 20, base_height], center=true);
	       translate([5, 0, ((base_height + top_height) / 2) - (fudge / 2)]) {
		    //top
		    cube([30, 20, top_height + (2 * fudge)], center=true);
	       }
	  }
     }

     // lf wheel
     translate([-20, -(track / 2), 0]) {
	  rotate([90, 0, -wheels_turn]) {
	       cylinder(h=wheel_width, r = wheel_radius, center=true);
	  }
     }
     // rf wheel
     translate([-20, (track / 2),  0]) {
	  rotate([90, 0, -wheels_turn]) {
	       cylinder(h=wheel_width, r = wheel_radius, center=true);
	  }
     }
     // front axle
     translate([-20, 0, 0]) {
	  rotate([90, 0, 0]) {
	       cylinder(h=track, r=2, center=true);
	  }
     }

     
     // lr wheel
     translate([20, -(track / 2), 0]) {
	  rotate([90, 0, 0]) {
	       cylinder(h=wheel_width, r = wheel_radius, center=true);
	  }
     }
     // rr wheel
     translate([20, (track / 2),  0]) {
	  rotate([90, 0, 0]) {
	       cylinder(h=wheel_width, r = wheel_radius, center=true);
	  }
     }
     // rear axle
     translate([20, 0, 0]) {
	  rotate([90, 0, 0]) {
	       cylinder(h=track, r=2, center=true);
	  }
     }


}
