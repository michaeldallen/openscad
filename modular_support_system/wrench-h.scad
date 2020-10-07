hex_size = 8.5;
face_length = hex_size / sqrt(3);
post_height = 10;
handle_height = 5;
roundcorner = 2;

fn_upper = 200;
fn_lower = 12;

rc = false;
$fn = rc ? fn_upper : fn_lower;




hull() {
    translate([0, 0, ((post_height+handle_height) / 2) + 0.001]) {
        hull() {
            cube([hex_size, face_length, post_height + handle_height], center=true);
    
            rotate([0, 0, 120]) {
                cube([hex_size, face_length, post_height+handle_height], center=true);
            }
            rotate([0, 0, 240]) {
                cube([hex_size, face_length, post_height+handle_height], center=true);
            }
        }
    }
    translate([0, 0, post_height + handle_height]) {
        cylinder(h = post_height / 10, d = hex_size);
    }
        

}
hull() {
    translate([0, 0, handle_height + (post_height / 10)]) {
        color("blue") cylinder(h = post_height / 10, d = hex_size);
    }
    translate([0, 0, handle_height]) {
        color("red") cylinder(h = post_height / 10, d = hex_size * 1.2 );
    }
}




minkowski() {
        union() {
            hull() {
                cylinder(h = handle_height, d = hex_size * 1.5);
                translate([hex_size * 4, 0, 0]) {
                    cylinder(h = handle_height, d = hex_size * 1/2);
                }
            }
        }
    sphere(r=roundcorner / 2);

}
  
translate([hex_size * 5.1, 0, 0]) {
    difference() {
        minkowski() {
            cylinder(h = handle_height, d = 16);
            sphere(r=roundcorner / 2);
        }
        translate([0, 0, -roundcorner]) {
            cylinder(h = handle_height + (roundcorner * 2), d=12);
        }
    }
}
