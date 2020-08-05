// More information: https://danielupshaw.com/openscad-rounded-corners/

// Set to 0.01 for higher definition curves (renders slower)
// $fs = 0.15;
$fs = 0.5;

module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							sphere(r = radius);
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							rotate(a = rotate)
							cylinder(h = diameter, r = radius, center = true);
						}
					}
				}
			}
		}
	}
}




scale=1.0;
height=10 * scale;
length=40 * scale;

pos_x = 20; 
pos_y = 70;
pos_z = 0;

rounding = 2;
/*
translate([pos_x -(length / 2), pos_y - 15  , pos_z -(height / 2)]) roundedcube([40,10, height], false, rounding, "all");
translate([pos_x -(length / 2), pos_y +  5  , pos_z -(height / 2)]) roundedcube([40,10,height], false, rounding, "ymax");
translate([pos_x -  5,          pos_y - 10  , pos_z -(height / 2)]) roundedcube([10,20,height], false, rounding, "y");
translate([pos_x + 10,          pos_y + 2.5 , pos_z -(height / 2)]) roundedcube([10,7.5,height], false, rounding, "ymin");
translate([pos_x + 10,          pos_y - 10  , pos_z -(height / 2)]) roundedcube([10,7.5,height], false, rounding, "ymax" );
translate([pos_x -(length / 2), pos_y + 2.5 , pos_z -(height / 2)]) roundedcube([10,7.5,height], false, rounding, "ymin");
translate([pos_x -(length / 2), pos_y - 10  , pos_z -(height / 2)]) roundedcube([10,7.5,height], false, rounding, "ymax");
*/






/* reference model



interior_open_length = 51;
bar_width = 10;
leg_length = 40;

                                                                         roundedcube([interior_open_length + (bar_width /2), bar_width, bar_width], true, rounding, "x");
translate([-1 * ((interior_open_length / 2) + (bar_width / 2)),  0,  0]) roundedcube([bar_width, leg_length, bar_width], true, rounding);
translate([      (interior_open_length / 2) + (bar_width / 2) ,  0,  0]) roundedcube([bar_width, leg_length, bar_width], true, rounding);

translate([-27.75, -15, 0]) roundedcube([10, 10, bar_width], true, rounding);
translate([ 27.75, -15, 0]) roundedcube([10, 10, bar_width], true, rounding);
translate([-27.75,  15, 0]) roundedcube([10, 10, bar_width], true, rounding);
translate([ 27.75,  15, 0]) roundedcube([10, 10, bar_width], true, rounding);

*/

color("Orange") {

    origin_x = 0;
    origin_y = 0;
    origin_z = 0;
    
    rounding = 3;

    fatness = 11;
    fatness_bridge = fatness;
    
    body_gap_fill = true; 
    arm_gap_fill =  false;
    hand_gap_fill = true;
    
    body_length = 51;
    arm_length = 45;
    hand_length = 15;


    body_dimensions = [body_length, fatness, fatness];
    body_position = [origin_x, origin_y, origin_z];
    translate(body_position) roundedcube(body_dimensions, true, rounding);
    if (body_gap_fill) {
        translate([origin_x - (body_length / 2), origin_y, origin_z]) roundedcube([rounding * 4, fatness_bridge, fatness_bridge], true, rounding);
        translate([origin_x + (body_length / 2), origin_y, origin_z]) roundedcube([rounding * 4, fatness_bridge, fatness_bridge], true, rounding);
    }
    
    
    
    
    arm_dimensions = [fatness, arm_length, fatness];
    arm_position_l = [origin_x + (-1 * ((body_length + fatness)/ 2)), origin_y, origin_z];
    arm_position_r = [origin_x +       ((body_length + fatness)/ 2) , origin_y, origin_z];

    translate(arm_position_l) roundedcube(arm_dimensions, true, rounding);
    if (arm_gap_fill) { 
        translate([origin_x + (-1 * ((body_length + fatness) / 2)), origin_y +       (arm_length / 2) , origin_z]) roundedcube([fatness_bridge, rounding * 4, fatness_bridge], true, rounding);
        translate([origin_x + (-1 * ((body_length + fatness) / 2)), origin_y + (-1 * (arm_length / 2)), origin_z]) roundedcube([fatness_bridge, rounding * 4, fatness_bridge], true, rounding);
    }

    translate(arm_position_r) roundedcube(arm_dimensions, true, rounding);
    if (arm_gap_fill) {
        translate([origin_x +       ((body_length + fatness) / 2) , origin_y +       (arm_length / 2) , origin_z]) roundedcube([fatness_bridge, rounding * 4, fatness_bridge], true, rounding);
        translate([origin_x +       ((body_length + fatness) / 2) , origin_y + (-1 * (arm_length / 2)), origin_z]) roundedcube([fatness_bridge, rounding * 4, fatness_bridge], true, rounding);
    }




    hand_position_ul = [origin_x + (-1 * (body_length / 2) + (hand_length / 2)), origin_y +        (arm_length / 2) - (fatness / 2)  , origin_z]; 
    hand_position_ll = [origin_x + (-1 * (body_length / 2) + (hand_length / 2)), origin_y + (-1 * ((arm_length / 2) - (fatness / 2))), origin_z];
    hand_position_ur = [origin_x +       (body_length / 2) - (hand_length / 2) , origin_y +        (arm_length / 2) - (fatness / 2)  , origin_z]; 
    hand_position_lr = [origin_x +       (body_length / 2) - (hand_length / 2) , origin_y + (-1 * ((arm_length / 2) - (fatness / 2))), origin_z];

    translate(hand_position_ul) roundedcube([hand_length, fatness, fatness], true, rounding);
    if (hand_gap_fill) {
        translate([origin_x + (-1 * (body_length / 2)), origin_y + (-1 * ((arm_length / 2) - (fatness / 2))), origin_z]) roundedcube([rounding * 4, fatness_bridge, fatness_bridge], true, rounding);
    }

    translate(hand_position_ll) roundedcube([hand_length, fatness, fatness], true, rounding);
    if (hand_gap_fill) {
        translate([origin_x + (-1 * (body_length / 2)), origin_y +       ((arm_length / 2) - (fatness / 2)) , origin_z]) roundedcube([rounding * 4, fatness_bridge, fatness_bridge], true, rounding);
    }

    translate(hand_position_ur) roundedcube([hand_length, fatness, fatness], true, rounding);
    if (hand_gap_fill) {
        translate([origin_x +       (body_length / 2) , origin_y +       ((arm_length / 2) - (fatness / 2)) , origin_z]) roundedcube([rounding * 4, fatness_bridge, fatness_bridge], true, rounding);
    }

    translate(hand_position_lr) roundedcube([hand_length, fatness, fatness], true, rounding);
    if (hand_gap_fill) {
        translate([origin_x +       (body_length / 2) , origin_y + (-1 * ((arm_length / 2) - (fatness / 2))), origin_z]) roundedcube([rounding * 4, fatness_bridge, fatness_bridge], true, rounding);
    } 
    
    
    message = str(fatness, "/", body_length, "/", arm_length, "/", hand_length);
    translate([origin_x , origin_y - (fatness / 2), -1 * (origin_z - (fatness / 2))]) {
      //  text(message, font = "Liberation Mono:style=Bold");

    }

}














