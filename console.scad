// Higher definition curves
$fs = 0.01;

difference(){//temporary - cut off back half

union(){
    difference(){ 
        // Body
        union(){
            // Screen Box
            roundedcube([112, 70, 30], true, 6);
            // Handle
            translate([0, -70, 0]) roundedcube([40, 130, 30], true, 6);
        }

        //Screen Hole (67mm x 50 mm)
        translate([0, 0, 10]) cube([67.01, 50.01, 30], true);
        
        // Thumbstick hole
        translate([0, -52, 10]) cylinder(30, 11, 11, true);
        
        union(){ // Interior
            //screen
            //translate([0, 0, 0]) roundedcube([105, 65, 25], true, 6);
            translate([0, 0, 0]) roundedcube([107, 65, 25], true, 2);
            //handle
            translate([0, -70, 0]) roundedcube([35,125,25], true, 6);
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

        // screw holes for screen
        translate([(110/2)-15, 0, 12.5-(3.43/2)]) {
                translate([0, 49/2, 0]) cylinder(7, 1.5, 1.5, true);
                translate([0, -49/2, 0]) cylinder(7, 1.5, 1.5, true);
        }

        translate([-((110/2)-10), 0, 12.5-(3.43/2)]) {
                translate([0, 49/2, 0]) cylinder(7, 1.5, 1.5, true);
                translate([0, -49/2, 0]) cylinder(7, 1.5, 1.5, true);
        }
        
       
        // screw holes for body
        
        translate([-30/2, -130, 0]) {
            cylinder(27.01, 1.5, 1.5, true);
            translate([0, 0, -14.5]) cylinder(2, 2.75, 2.75, true);
        }
        translate([30/2, -130, 0]) {
            cylinder(27.01, 1.5, 1.5, true);
            translate([0, 0, -14.5]) cylinder(2, 2.75, 2.75, true);
        }
        translate([102/2, 60/2, 0]) {
            cylinder(27.01, 1.5, 1.5, true);
            translate([0, 0, -14.5]) cylinder(8, 2.75, 2.75, true);
        }
        
        translate([102/2, -60/2, 0]) {
            cylinder(27.01, 1.5, 1.5, true);
            translate([0, 0, -14.5]) cylinder(2, 2.75, 2.75, true);
        }
        
        translate([-102/2, 60/2, 0]) {
            cylinder(27.01, 1.5, 1.5, true);
            translate([0, 0, -14.5]) cylinder(2, 2.75, 2.75, true);
        }
        
        translate([-102/2, -60/2, 0]) {
            cylinder(27.01, 1.5, 1.5, true);
            translate([0, 0, -14.5]) cylinder(2, 2.75, 2.75, true);
        }
 
    }
    
    // close off battery compartment, but leave a 8x12mm hole for connector
     translate([0, -75, 0]) difference(){
       cube([35, 2, 25], true);
       translate([-15, 0, 0]) cube([2, 3, 3], true);
     }
            
    // Mounting blocks for screen.  
    // Height above base: 3.43 mm
    // Screw hole 3mm  
    translate([(110/2)-15, 0, 12.5-(4.44/2)]) 
        difference(){
            cube([5.00, 55, 4.43], true);
            translate([0, 50/2, 0]) cylinder(6, 1.5, 1.5, true);
            translate([0, -50/2, 0]) cylinder(6, 1.5, 1.5, true);
            cube([5.01, 44, 4.44], true);
        }
        
    translate([-((110/2)-10.01), 0, 12.5-(4.44/2)]) 
        // Bizzarely adding .01mm to x here addresses an 
        // "Object may not be a valid 2-manifold and may need repair!" error
        difference(){
            cube([5.00, 55, 4.43], true);
            translate([0, 50/2, 0]) cylinder(6, 1.5, 1.5, true);
            translate([0, -50/2, 0]) cylinder(6, 1.5, 1.5, true);
            cube([5.01, 44, 4.44], true);
        }
        
      // Standoffs for circuit boards.  Trying cylinders
      circuit_board_standoff_height=6.5;
      translate([-(64/2)+4, 0, (-(25/2)+(circuit_board_standoff_height/2))]) 
        difference(){
            union(){
                translate([-37/2, 57/2, 0]) cylinder(circuit_board_standoff_height, 2, 2, true);
                translate([-37/2, -57/2, 0]) cylinder(circuit_board_standoff_height, 2, 2, true);
                translate([37/2, 57/2, 0]) cylinder(circuit_board_standoff_height, 2, 2, true);
                translate([37/2, -57/2, 0]) cylinder(circuit_board_standoff_height, 2, 2, true);
            }
            translate([-37/2, 57/2, 0]) cylinder(circuit_board_standoff_height+0.1, 1, 1, true);
            translate([-37/2, -57/2, 0]) cylinder(circuit_board_standoff_height+0.1, 1, 1, true);
            translate([37/2, 57/2, 0]) cylinder(circuit_board_standoff_height+0.1, 1, 1, true);
            translate([37/2, -57/2, 0]) cylinder(circuit_board_standoff_height+0.1, 1, 1, true);
        }  
        
      translate([(64/2)-4, 0, (-(25/2)+(circuit_board_standoff_height/2))]) 
        difference(){
            union(){
                translate([-37/2, 57/2, 0]) cylinder(circuit_board_standoff_height, 2, 2, true);
                translate([-37/2, -57/2, 0]) cylinder(circuit_board_standoff_height, 2, 2, true);
                translate([37/2, 57/2, 0]) cylinder(circuit_board_standoff_height, 2, 2, true);
                translate([37/2, -57/2, 0]) cylinder(circuit_board_standoff_height, 2, 2, true);
            }
            translate([-37/2, 57/2, 0]) cylinder(circuit_board_standoff_height+0.1, 1, 1, true);
            translate([-37/2, -57/2, 0]) cylinder(circuit_board_standoff_height+0.1, 1, 1, true);
            translate([37/2, 57/2, 0]) cylinder(circuit_board_standoff_height+0.1, 1, 1, true);
            translate([37/2, -57/2, 0]) cylinder(circuit_board_standoff_height+0.1, 1, 1, true);
        } 
        
        
     
/*
    translate([-((110/2)-10), 0, 12.5-(4.94/2)]) 
        difference(){
            cube([5.00, 54, 4.93], true);
            translate([0, 49/2, 0]) cylinder(6, 1.5, 1.5, true);
            translate([0, -49/2, 0]) cylinder(6, 1.5, 1.5, true);
            cube([5.01, 43, 4.94], true);
        }
*/            
            
    // Mounting block for thumbstick
    thumbstick_standoff_height=7;
    translate([0, -50, -(25-7)/2]) {
        difference(){
            union(){
                translate([20/2, (26/2)-2, 0]) cylinder(thumbstick_standoff_height, 2.5, 2.5, true);
                translate([-20/2, (26/2)-2, 0]) cylinder(thumbstick_standoff_height, 2.5, 2.5, true);
                translate([-20/2, -(26/2)-2, 0]) cylinder(thumbstick_standoff_height, 2.5, 2.5, true);
                translate([20/2, -(26/2)-2, 0]) cylinder(thumbstick_standoff_height, 2.5, 2.5, true);
            }
            //cube([27, 36, 7], true);    
            translate([20/2, (26/2)-2, 0]) cylinder(thumbstick_standoff_height+.1, 1.5, 1.5, true);
            translate([-20/2, (26/2)-2, 0]) cylinder(thumbstick_standoff_height+.1, 1.5, 1.5, true);
            translate([-20/2, -(26/2)-2, 0]) cylinder(thumbstick_standoff_height+.1, 1.5, 1.5, true);
            translate([20/2, -(26/2)-2, 0]) cylinder(thumbstick_standoff_height+.1, 1.5, 1.5, true);
            //translate([0, -2, 0]) cube([27.01, 18.01, 7.01], true);
            //translate([0, 0, 0]) cube([12.01, 36.01, 7.01], true);
        }
    }
    
    // Body Screws - Whatever it's called, the bits that hold the halves together.
    translate([-30/2, -130, 0]) difference(){
        cube([5, 5, 24.5], true);
        cylinder(26.1, 1.5, 1.5, true);
    }
    translate([30/2, -130, 0]) difference(){
        cube([5, 5, 25], true);
        cylinder(26.1, 1.5, 1.5, true);
    }
  
    translate([102/2, 60/2, 0]) difference(){
        cube([5, 5, 24.5], true);
        cylinder(26.1, 1.5, 1.5, true);
    }
    
    translate([102/2, -60/2, 0]) difference(){
        cube([5, 5, 25], true);
        cylinder(26.1, 1.5, 1.5, true);
    }
    
    translate([-102/2, 60/2, 0]) difference(){
        cube([5, 5, 25], true);
        cylinder(26.1, 1.5, 1.5, true);
    }
    
    translate([-102/2, -60/2, 0]) difference(){
        cube([5, 5, 25], true);
        cylinder(26.1, 1.5, 1.5, true);
    }
    
}
    
    
// temporary - cut off back half
//translate([0, 0, -15]) cube([400, 400, 30], true);
// temporary - cut off front half
 translate([0, 0, 15]) cube([400, 400, 30], true);

// Temporary - cut off most of back
//translate([0, 0, -8]) cube([400, 400, 30], true);

// temporary - cut off bottom 
//translate([0, -120, 0]) cube([120, 170, 40], true);

// temporary - cut off top
//translate([0, 175, 0]) cube([400, 400, 400], true);

// temporary - cut off right side
//translate([60, -50, 0]) cube([120, 170, 40], true);


}



// temporary - battery
// translate([0, -104, -5]) cube([26, 48, 17], true);

// Notes
// * Maybe extend handle a bit for space to add screws
// * battery compartment - smaller hole but crosses seam
// * Rounded edge on thumbstick hole
// * Hole for power switch
// * Hole for Arduino access
// The thumbstick needs to mount 18mm from the inside front







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