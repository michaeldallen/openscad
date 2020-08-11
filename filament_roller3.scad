roundcorner = true;
roundcorner = false;

$fn = roundcorner ? 20 : 20;


roundcorner_size = 5; 
roundcorner_adjustment = roundcorner ? roundcorner_size : 0;

roller_main_shaft_length = 25 - roundcorner_adjustment;
roller_diameter = 50 - roundcorner_adjustment;

hanger_slot_span = 15 - roundcorner_adjustment;
hanger_slot_span_slop = 0.0;

hanger_slot_width = 10;
hanger_slot_width_slop = 0.0;

cap_crown_height = 10 - roundcorner_adjustment;
cap_funnel_height = 20;


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
/*
        translate([5, 0, (roller_main_shaft_length / 2) + hanger_slot_width + cap_funnel_height + (cap_crown_height / 2)]) {
              cylinder(h = cap_crown_height, d = roller_diameter, center = true);
          }
//      }
*/
    
}


if (roundcorner) {
    minkowski() {
        roller();
        sphere(d=roundcorner_adjustment);
    }
} else {
    roller();
}
    





