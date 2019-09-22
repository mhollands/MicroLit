$fn = 25;
base_width = 52.3;
base_length = 50;
base_thickness = 3;
front_height = 47.5;
hole_shift = 4.5;
pcb_hole_rad = 1.45;
pcb_thickness = 1.6;
pcb_stand_off = 2.5;
standoff_rad = 2;
hole_x_separation = 44;
hole_y_separation = 33;
front_hole_radius = 2;
front_hole_offset = 12;
window = 20;
window_offset = 25;

module standoff()
{
	translate([0,0,(pcb_stand_off+pcb_thickness)/2])
		cylinder(r = pcb_hole_rad, h=pcb_stand_off+pcb_thickness, center=true);
	translate([0,0,(pcb_stand_off)/2])
		cylinder(r = standoff_rad, h=pcb_stand_off, center=true);
}

cube([base_width, base_length, base_thickness], center=true);
translate([hole_x_separation/2, hole_y_separation/2+hole_shift, base_thickness/2]) standoff();
translate([-hole_x_separation/2, hole_y_separation/2+hole_shift, base_thickness/2]) standoff();
translate([hole_x_separation/2, -hole_y_separation/2+hole_shift, base_thickness/2]) standoff();
translate([-hole_x_separation/2, -hole_y_separation/2+hole_shift, base_thickness/2]) standoff();

translate([0,-base_length/2-base_thickness/2,(front_height+pcb_stand_off)/2])
	difference()
	{
		cube([base_width, base_thickness, front_height+base_thickness+pcb_stand_off], center=true);
		translate([0,0,-(front_height-base_thickness-pcb_stand_off)/2+window_offset])
			cube([window,base_thickness,window],center=true);
		translate([0,0,-(front_height-base_thickness-pcb_stand_off)/2+front_hole_offset])
			rotate([90,0,0]) cylinder(r=front_hole_radius, h = base_thickness*2, center=true);
	}