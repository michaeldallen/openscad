roundcorner = true;
//roundcorner = false;


$fn = roundcorner ? 20 : 20;


roundcorner_size = roundcorner ? 5 : 0;

roller_main_shaft_length = 50;
roller_diameter = 50;

hanger_slot_span = 15;
hanger_slot_span_slop = 0.0;

hanger_slot_width = 10;
hanger_slot_width_slop = 0.0;

cap_crown_height = 5;
cap_funnel_height = 10;


// yardstick
//translate([0, hanger_slot_span / 2, 0]) color("purple") cube([roller_diameter, hanger_slot_span, roller_main_shaft_length + hanger_slot_width + cap_funnel_height + cap_crown_height], center = true);
translate([0, hanger_slot_span / 4, 0]) color("purple") cube([roller_diameter, hanger_slot_span, roller_main_shaft_length], center = true);


module spine () {
    // no minkowski on the spine
    hull () {
        translate([      (roller_diameter / 2) - (hanger_slot_span / 2), 0, 0] ) {
            cylinder(d = hanger_slot_span, h = roller_main_shaft_length + hanger_slot_width + cap_funnel_height + cap_crown_height, center = true);
        }
        translate([-1 * ((roller_diameter / 2) - (hanger_slot_span / 2)), 0, 0]) {
            cylinder(d = hanger_slot_span, h = roller_main_shaft_length + hanger_slot_width + cap_funnel_height + cap_crown_height, center = true);
        }
    }    
}

module torso () {
    if (roundcorner) {
        minkowski() {
            cylinder(d = roller_diameter - roundcorner_size, h = roller_main_shaft_length - roundcorner_size, center = true);
            sphere(d=roundcorner_size);
        }
    } else {
        cylinder(d = roller_diameter, h = roller_main_shaft_length, center = true);
    }
}

module cap () {
}

spine();
torso();
cap();

/*

module roller() {

    // main roller
    cylinder(h = roller_main_shaft_length, d = roller_diameter, center = true);


    // hanger_slot
    hull() {
        translate([0, 0, (roller_main_shaft_length / 2) + (hanger_slot_width / 2)]) {
            translate([(roller_diameter / 2) - (hanger_slot_width / 2), 0, 0]) {        
                cylinder(h = hanger_slot_span, d = hanger_slot_width, center = true);
            }
            translate([-((roller_diameter / 2) - (hanger_slot_width / 2)), 0, 0]) {
                cylinder(h = hanger_slot_span, d = hanger_slot_width, center = true);
            }
        }
    }

    // funnel
//    hull() {
        translate([0, 0, (roller_main_shaft_length / 2) + hanger_slot_width + (cap_funnel_height / 2)]) {
            translate([(roller_diameter / 2) - (hanger_slot_width / 2), 0, 0]) {        
                cylinder(h = hanger_slot_width, d = hanger_slot_span, center = true);
            }
            translate([-((roller_diameter / 2) - (hanger_slot_width / 2)), 0, 0]) {
                cylinder(h = hanger_slot_width, d = hanger_slot_span, center = true);
            }
          }

        translate([5, 0, (roller_main_shaft_length / 2) + hanger_slot_width + cap_funnel_height + (cap_crown_height / 2)]) {
              cylinder(h = cap_crown_height, d = roller_diameter, center = true);
          }
//      }
    
}


if (roundcorner) {
    minkowski() {
        roller();
        sphere(d=roundcorner_adjustment);
    }
} else {
    roller();
}
    





*/
