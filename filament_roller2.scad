//roundcorner = true;
roundcorner = false;

$fn = roundcorner ? 100 : 10;

//roller_main_shaft_length = 110;
roller_main_shaft_length = 25;
roller_diameter = 50;

hanger_slot_span = 15;
hanger_slot_span_slop = 0.0;

hanger_slot_width = 10;
hanger_slot_width_slop = 0.0;

cap_height = 10;

roundcorner_adjustment = roundcorner ? 5 : 0;


minkowski() {
    union () {

        //main roller
        cylinder(h = roller_main_shaft_length - roundcorner_adjustment, d = roller_diameter - roundcorner_adjustment, center = true);

        //hanger slot bar
        translate([0, 0, (roller_main_shaft_length + hanger_slot_width) / 2]) {
            translate([ ((roller_diameter - hanger_slot_span + hanger_slot_span_slop) / 2), 0, 0]) {
                cylinder(h = hanger_slot_width + hanger_slot_width_slop + roundcorner_adjustment, d = hanger_slot_span - roundcorner_adjustment - hanger_slot_span_slop, center = true);
            }
            translate([-((roller_diameter - hanger_slot_span + hanger_slot_span_slop) / 2), 0, 0]) {
                cylinder(h = hanger_slot_width + hanger_slot_width_slop + roundcorner_adjustment, d = hanger_slot_span - roundcorner_adjustment - hanger_slot_span_slop, center = true);
            }
            cube([roller_diameter - (hanger_slot_span - hanger_slot_span_slop), hanger_slot_span - roundcorner_adjustment - hanger_slot_span_slop, hanger_slot_width  + roundcorner_adjustment], center = true);
        }

        //cap
        translate([0, 0, (roller_main_shaft_length / 2) + (hanger_slot_width * 1.5) ]) {
            hull () {
                translate([((roller_diameter - hanger_slot_span + hanger_slot_span_slop) / 2), 0, 0]) {
                    cylinder(h = hanger_slot_width + hanger_slot_width_slop - (roundcorner_adjustment / 2), d = hanger_slot_span  - roundcorner_adjustment - hanger_slot_span_slop, center = true);
                }
                translate([-((roller_diameter - hanger_slot_span + hanger_slot_span_slop) / 2), 0, 0]) {
                    cylinder(h = hanger_slot_width + hanger_slot_width_slop - (roundcorner_adjustment / 2), d = hanger_slot_span  - roundcorner_adjustment - hanger_slot_span_slop, center = true);
                }
            
                translate([0, 0, hanger_slot_width]) {
                    cylinder(h = hanger_slot_width + hanger_slot_width_slop - roundcorner_adjustment, d = roller_diameter - roundcorner_adjustment, center = true);
                }
            }
        }

    }

    if (roundcorner) {
        sphere(d=roundcorner_adjustment);
    }
}


/*
translate([10,0,-50]) color("red") minkowski() {
    union () {

        //main roller
        cylinder(h = roller_main_shaft_length, d = roller_diameter, center = true);

        //hanger slot bar
        translate([0, 0, (roller_main_shaft_length + hanger_slot_width) / 2]) {
            translate([ ((roller_diameter - hanger_slot_span + hanger_slot_span_slop) / 2), 0, 0]) {
                cylinder(h = hanger_slot_width + hanger_slot_width_slop, d = hanger_slot_span - hanger_slot_span_slop, center = true);
            }
            translate([-((roller_diameter - hanger_slot_span + hanger_slot_span_slop) / 2), 0, 0]) {
                cylinder(h = hanger_slot_width + hanger_slot_width_slop, d = hanger_slot_span - hanger_slot_span_slop, center = true);
            }
            cube([roller_diameter - (hanger_slot_span - hanger_slot_span_slop), hanger_slot_span - hanger_slot_span_slop, hanger_slot_width], center = true);
        }

        //cap
        translate([0, 0, (roller_main_shaft_length / 2) + (hanger_slot_width * 1.5) ]) {
            hull () {
                translate([((roller_diameter - hanger_slot_span + hanger_slot_span_slop) / 2), 0, 0]) {
                    cylinder(h = hanger_slot_width + hanger_slot_width_slop, d = hanger_slot_span - hanger_slot_span_slop, center = true);
                }
                translate([-((roller_diameter - hanger_slot_span + hanger_slot_span_slop) / 2), 0, 0]) {
                    cylinder(h = hanger_slot_width + hanger_slot_width_slop, d = hanger_slot_span - hanger_slot_span_slop, center = true);
                }
                translate([0, 0, hanger_slot_width]) {
                    cylinder(h = hanger_slot_width + hanger_slot_width_slop, d = roller_diameter, center = true);
                }
            }
        }
        
    }


}
*/