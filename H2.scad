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



interior_open_length = 51;
bar_width = 10;
leg_length = 40;

                                                                         roundedcube([interior_open_length + (bar_width /2), bar_width, bar_width], true, rounding, "x");
translate([-1 * ((interior_open_length / 2) + (bar_width / 2)),  0,  0]) roundedcube([bar_width, leg_length, bar_width], true, rounding);
translate([      (interior_open_length / 2) + (bar_width / 2) ,  0,  0]) roundedcube([bar_width, leg_length, bar_width], true, rounding);
translate([-1 * ((interior_open_length / 2) + (bar_width / 4)), -15, 5]) roundedcube([10, 10, bar_width], true, rounding);
translate([ 27.75, -15, 0]) roundedcube([10, 10, bar_width], true, rounding);
translate([-27.75,  15, 0]) roundedcube([10, 10, bar_width], true, rounding);
translate([ 27.75,  15, 0]) roundedcube([10, 10, bar_width], true, rounding);




