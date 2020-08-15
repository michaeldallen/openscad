
rc = true; 
//rc = false;

extra_fine = false;

$fn = rc ? (extra_fine ? 200 : 100) : 10;


posts = 3;
post_width = 10;

post_gap = post_width / 2;

base_base_width = post_width + (post_gap / 2);
//base_width = 25;
base_width = base_base_width * posts;

base_height = base_width / 5; 

post_height = base_width * (3/4);


corner_rounding = post_width / 4;

gap = (base_width - (posts * post_width)) / (posts - 1);


module base() {
    color("red") hull() {
        for(x = [0:(posts - 1)]) {
            for(y = [0:(posts - 1)]) {
                translate([x * (post_width + gap), y * (post_width + gap), 0]) {
                    cylinder(d = post_width, h = base_height);
                }
            }
        }
    }
}




module towers() {
    //color("purple") cube([15,15,post_height]);
    for(x = [0:(posts - 1)]) {
        for(y = [0:(posts - 1)]) {
            color("blue") minkowski() {
                translate([x * (post_width + gap), y * (post_width + gap), corner_rounding / 2]) {
                    cylinder(d = post_width - corner_rounding, h = post_height - corner_rounding);
                }
                sphere(d = corner_rounding);
            }
        }
    }
}




module yardstick() {
    translate([-corner_rounding*2, -corner_rounding*2, 10]) {
        color("purple") cube([base_width, base_width, 10]);
    }
}


translate([(corner_rounding * 2) - (base_width / 2), (corner_rounding * 2) - (base_width / 2), 0]) {
    base();
    towers();

    //yardstick();
}



