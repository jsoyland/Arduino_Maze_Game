// Higher definition curves
$fs = 0.01;


difference(){
    //Take out cylinder for thumbstick   
    difference(){
        // Body
        color("Orange")
        union(){
            roundedcube([110, 70, 30], true, 6);
            translate([0, -60, 0]) roundedcube([40, 100, 30], true, 6);
        }

        //Screen Hole is 67mm x 50 mm 
        translate([0, 0, 10]) cube([67, 50, 30], true);
    }
    
    // Cylinder for thumbstick
    translate([0, -50, 10]) cylinder(30, 11, 11, true);
}




module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
    // Usage:
    // An [x, y, z] vector specifies distance on each axis. Default [1, 1, 1]
    // size = [2, 3, 5];

    // An integer creates a cube with specified wall distance. Default [1, 1, 1]
    // size = 5;

    // Whether or not to place the object centered on the origin. Default false
    // center = true|false;

    // // Specify a rounding radius. Default 0.5
    // radius = 0.5

    // Specify where to apply the rounded corners. Default "all"
    // apply_to = "all"|"x"|"y"|"z"|"zmax"|"zmin"|"xmax"|"xmin"|"ymax"|"ymin"

    // roundedcube(size, center, radius, apply_to);
    
    
    
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

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
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}