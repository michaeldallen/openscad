peg_height = 20;
peg_width = 10;

base_length = 74;
base_width = 20;
base_height = 5;


fn_upper = 50;
fn_lower = 12;

rc = false;
$fn = rc ? fn_upper : fn_lower;


hull() {
    translate([-(peg_width / 2), - (peg_width / 2), 0]) {
        cylinder(d = peg_width, h = base_height);
    }
    translate([base_length + (peg_width / 2), - (peg_width / 2), 0]) {
        cylinder(d = peg_width, h = base_height);
    }
    translate([-(peg_width / 2), base_width + (peg_width / 2), 0]) {
        cylinder(d = peg_width, h = base_height);
    }
    translate([base_length + (peg_width / 2), base_width + (peg_width / 2), 0]) {
        cylinder(d = peg_width, h = base_height);
    }
}



translate([-(peg_width / 2), 0, 0]) {
    color("green") cylinder(d = peg_width, h = peg_height);
}
translate([0, -(peg_width / 2), 0]) {
    cylinder(d = peg_width, h = peg_height);
}


translate([base_length + (peg_width / 2), 0, 0]) {
    color("blue") cylinder(d = peg_width, h = peg_height);
}
translate([base_length,  -(peg_width / 2), 0]) {
    cylinder(d = peg_width, h = peg_height);
}

translate([-(peg_width / 2), base_width, 0]) {
    color("orange") cylinder(d = peg_width, h = peg_height);
}
translate([0, (peg_width / 2) + base_width, 0]) {
    cylinder(d = peg_width, h = peg_height);
}

translate([base_length + (peg_width / 2), base_width, 0]) {
    color("grey") cylinder(d = peg_width, h = peg_height);
}
translate([base_length , base_width+ (peg_width / 2), 0]) {
    cylinder(d = peg_width, h = peg_height);
}

//color("red") cube([74, 20, 10]);

