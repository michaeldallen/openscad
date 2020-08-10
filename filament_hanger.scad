

shaft_length = 130;
top_tail_length = 10;
bottom_tail_length = 20;

hook_diameter = 30;

roundcorner = true;
//roundcorner = false;

girth = roundcorner ? 5 : 10;
$fn = roundcorner ? 125 : 10;

minkowski() {
    union() {
        
        //backbone
        cube([shaft_length, girth, girth], true);

        //top loop
        translate([-(shaft_length / 2), -((hook_diameter /2) - (girth / 2)), 0]) {
            
//            cylinder(d=15, h=40, center = true);
            
            difference () { 
                cylinder(h = girth, d = hook_diameter, center = true);
                cylinder(h = girth, d = hook_diameter - (girth * 2), center = true);
                translate([hook_diameter / 4, -(girth /2), 0]) {
                    cube([hook_diameter / 2,hook_diameter - girth, girth], true);
                }
            }

            //top tail
            translate([(top_tail_length / 2), -((hook_diameter / 2) - (girth / 2)), 0]) {
                cube([top_tail_length, girth, girth], center = true);
            }

            //top front spur
            translate([girth/2, -((hook_diameter / 2) + (girth / 2)), 0]) {
                cube([girth, girth, girth], center = true);
            }
        
/*
            //top back spur
            translate([girth/2, ((hook_diameter / 2) + (girth / 2)), 0]) {
                cube([girth, girth, girth], center = true);
            }
*/

        }
        
        
        //bottom loop
        translate([shaft_length / 2, -((hook_diameter / 2) - (girth / 2)), 0]) {
            difference () { 
                cylinder(h = girth, d = hook_diameter, center = true);
                cylinder(h = girth, d = hook_diameter - (girth * 2), center = true);
                translate([-(hook_diameter / 4), -(girth / 2), 0]) {
                    cube([hook_diameter / 2,hook_diameter - girth, girth], true);
                }
            }

            //bottom tail
            translate([-(bottom_tail_length / 2), -((hook_diameter / 2) - (girth / 2)), 0]) {
                cube([bottom_tail_length, girth, girth], center = true);
            }
        }
    }

    if (roundcorner) {
        sphere(d=girth);
    }

}



