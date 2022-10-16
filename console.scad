// Higher definition curves
$fs = 0.01;

difference(){//temporary - cut off back half

union(){
    difference(){//rounded corners on display hole
        difference(){ // Cut out interior
            difference(){  //subtract thumbstick hole  
                difference(){ // subtract screen hole
                    // Body
                    union(){
                        // Screen Box
                        roundedcube([110, 70, 30], true, 6);
                        // Handle
                        translate([0, -70, 0]) roundedcube([40, 130, 30], true, 6);
                    }

                    //Screen Hole (67mm x 50 mm)
                    translate([0, 0, 10]) cube([67.01, 50.01, 30], true);
                }
                
                // Thumbstick hole
                translate([0, -50, 10]) cylinder(30, 11, 11, true);
            }
            
            union(){ // Interior
                //translate([0, 0, 0]) cube([105,64,25], true);
                translate([0, 0, 0]) roundedcube([105, 65, 25], true, 6);
                //translate([0, -75, 0]) cube([30,120,25], true);
                translate([0, -70, 0]) roundedcube([35,125,25], true, 6);
            }
        }

    // subtract rounded corners on display hole
    translate([0 , 0, .01]) 
        difference(){
            difference(){
                translate([0, 0, 14.5]) cube([69, 52, 1], true);
                translate([0, 0, 14.5]) cube([67, 50, 1.1], true);
            }
            
            union(){
                translate([0, 26, 14]) rotate([90, 0, 90]) cylinder(70, 1, 1, true);
                translate([0, -26, 14]) rotate([90, 0, 90]) cylinder(70, 1, 1, true);
                translate([34.5, 0, 14]) rotate([90, 0, 0]) cylinder(52, 1, 1, true);
                translate([-34.5, 0, 14]) rotate([90, 0, 0]) cylinder(52, 1, 1, true);
            }
        }
    }
    
        // close off battery compartment, but leave a 8x12mm hole for connector
         translate([0, -75, 0]) difference(){
           cube([35, 2, 25], true);
           translate([-8, 0, -6]) cube([8, 3, 11], true);
         }
            
        
    
        // Mounting holes for screen.  
        // Height above base: 3.43 mm
        // Screw hole 3mm
        translate([(110/2)-15, 0, 12.5-(3.43/2)]) 
            difference(){
                cube([5, 54, 3.43], true);
                translate([0, 49/2, 0]) cylinder(5, 1.5, 1.5, true);
                translate([0, -49/2, 0]) cylinder(5, 1.5, 1.5, true);
                cube([5.01, 43, 3.44], true);
            }

        translate([-((110/2)-10), 0, 12.5-(3.43/2)]) 
            difference(){
                cube([5, 54, 3.43], true);
                translate([0, 49/2, 0]) cylinder(5, 1.5, 1.5, true);
                translate([0, -49/2, 0]) cylinder(5, 1.5, 1.5, true);
                cube([5.01, 43, 3.44], true);
            }
}
    
    
// temporary - cut off back half
 translate([0, 0, -15]) cube([400, 400, 30], true);
// temporary - cut off front half
//translate([0, 0, 15]) cube([400, 400, 30], true);
}



// temporary - battery
// translate([0, -104, -5]) cube([26, 48, 17], true);

// Notes
// * Maybe extend handle a bit for space to add screws
// * battery compartment - smaller hole but crosses seam
// * Rounded edge on thumbstick hole
// * Hole for power switch
// * Hole for Arduino access
// screen holders were 1.46 too tall







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