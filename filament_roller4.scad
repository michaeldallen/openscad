roundcorner = true;
//roundcorner = false;

//rc = true; 
rc = false;

fine = true;
wickedfine = true;
rcness = fine ? wickedfine ? 200 : 100 : 50;



pins = true; 
roller = true; 

$fn = roundcorner ? (rc ? rcness : 20) : 20;


roundcorner_size = roundcorner ? 5 : 0;

roller_main_shaft_length = 110;
roller_diameter = 50;

hanger_slot_span_slop = 0.1;
hanger_slot_span = 15 + hanger_slot_span_slop;

hanger_slot_width_slop = 0.0;
hanger_slot_width = 10 + hanger_slot_width_slop;

cap_crown_height = 10;
cap_funnel_height = 10;

echo(" rc: ",  rc);
echo("$fn: ", $fn);

module yardstick() {
    //translate([0, hanger_slot_span / 4, 0]) color("purple") cube([roller_diameter, hanger_slot_span, roller_main_shaft_length + ((hanger_slot_width + cap_funnel_height + cap_crown_height ) * 2)], center = true);
    translate([0, hanger_slot_span / 4, 0]) color("purple") cube([roller_diameter, hanger_slot_span, roller_main_shaft_length+ ((hanger_slot_width + cap_funnel_height + cap_crown_height ) * 2)], center = true);
}


module spine () {

    color("purple") hull () {
        translate([      (roller_diameter / 2) - (hanger_slot_span / 2), 0, 0] ) {
            cylinder(d = hanger_slot_span, h = roller_main_shaft_length + ((hanger_slot_width ) * 2), center = true);
        }
        translate([-1 * ((roller_diameter / 2) - (hanger_slot_span / 2)), 0, 0]) {
            cylinder(d = hanger_slot_span, h = roller_main_shaft_length + ((hanger_slot_width) * 2), center = true);
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

    translate([0, 0, (roller_main_shaft_length / 2) + hanger_slot_width]) {

        difference () {
            color("pink") hull () {

                translate([      (roller_diameter / 2) - (hanger_slot_span / 2), 0, cap_funnel_height / 2] ) {
                    color("green") cylinder(d = hanger_slot_span, h = cap_funnel_height, center = true);
                }
                translate([-1 * ((roller_diameter / 2) - (hanger_slot_span / 2)), 0, cap_funnel_height / 2]) {
                    color("blue") cylinder(d = hanger_slot_span, h = cap_funnel_height, center = true);
                }


                translate([0, 0, cap_funnel_height]) {
                    color("red") {
                        translate([0, 0, cap_crown_height / 2]) {
                            if (roundcorner) {
                                minkowski() {
                                    cylinder(d = roller_diameter - roundcorner_size, h = cap_crown_height - roundcorner_size, center = true);
                                    sphere(d=roundcorner_size);
                                }
                            } else {
                                cylinder(d = roller_diameter, h = cap_crown_height, center = true);
                            }
                        }
                    }
                }
            }

            // finger pocket
            translate([0, 0, cap_funnel_height + cap_crown_height]) {
//                color("green") sphere(d = cap_crown_height + cap_funnel_height);
                color("green") sphere(d = roller_diameter / 2);
            }

        }
    }
}


module model() {
    rotate([0, 90, 0]) {
        spine();
        torso();
        cap();
        rotate([180, 0, 0]) cap();
    //    yardstick();
    }
}


module post() {
    minkowski() {
        cylinder(h = (roller_diameter / 2) - (roundcorner_size), d = (roller_diameter / 4) - roundcorner_size, center = true);
        sphere(d = roundcorner_size);
    }

}

module stubby_post() {
    minkowski() {
        cylinder(h = (roller_diameter / 2) - (roundcorner_size * 2), d = (roller_diameter / 4) - roundcorner_size);
        sphere(d = roundcorner_size);
    }

}




if (roller) {
    difference() {
        intersection() {
            // cut off bottom half
            model();
            translate([0, 0, roller_diameter/4]) {
                cube([roller_main_shaft_length + ((hanger_slot_width + cap_funnel_height + cap_crown_height ) * 2), roller_diameter, roller_diameter / 2], center = true);
            }
        }
        translate([-roller_main_shaft_length/4,0,0]) {
            post();
        }
        translate([ roller_main_shaft_length/4,0,0]) {
            post();
        }
    }
}


if (pins) {
    translate([ roller_diameter / 2, roller_diameter, 0]) {
        stubby_post();
    }
}
