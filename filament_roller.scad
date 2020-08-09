$fn = 15;

roller_width = 120;
bearing_width = 7;
bearing_inner_diameter = 8;
bearing_outer_diameter = 22;
roller_thickness = 4;
inner_flange_width = 2;
inner_flange_thickness = 1;


// roller
difference() {
    cylinder(roller_width, d= bearing_outer_diameter + roller_thickness);
    cylinder(roller_width, d= bearing_outer_diameter                   );
}


// inner bearing flange
translate([0,0,bearing_width]) {
    difference() {
        cylinder(inner_flange_width, d = bearing_outer_diameter + roller_thickness      );
        cylinder(inner_flange_width, d = bearing_outer_diameter - inner_flange_thickness);
    }
}

translate([0,0,roller_width - (bearing_width + inner_flange_width)]) {
    difference() {
        cylinder(inner_flange_width, d = bearing_outer_diameter + roller_thickness      );
        cylinder(inner_flange_width, d = bearing_outer_diameter - inner_flange_thickness);
    }
}