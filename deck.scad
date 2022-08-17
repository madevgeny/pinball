$fs=0.1;

height = 20;
depth = 4;
width = 12;

start = -width / 2;

height_small = 5;

thick = 0.5;

sep_thick = 0.25;
sphere_radius = 0.4;
pin_radius = 0.1;

two_pokets = [
[0, 0, (height_small - height) / 2]
];

four_pokets = [
[0, 0, (height_small - height) / 2],
[start + 3 - sep_thick/2, 0, (height_small - height) / 2],
[-start - 3 + sep_thick/2, 0, (height_small - height) / 2],

];

sphere(r = sphere_radius, $fs=0.1);

union(){
	difference () {
		cube([width + 2 * thick, depth, height + 2 * thick], center = true);
		translate([0, thick, 0]) 
			cube([width, depth, height], center = true);
	}
	
	for (a = four_pokets)
		translate(a)
			cube([sep_thick, depth, height_small], center = true);

	
}


rotate(a=90, v=[1,0,0]) { 
	cylinder(h=depth, r=pin_radius, center=true);
}
