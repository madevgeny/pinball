$fs=0.1;

ball_radius = 0.4;
WIDTH = 12;
HEIGHT = 20;
DEPTH = 4;


sphere(r = ball_radius, $fs=0.1);

module Box(width, height, depth){
    thikness = 0.5;   
    difference () {
		cube([width + 2 * thikness, depth, height + 2 * thikness], center = true);
		translate([0, thikness, 0]) 
			cube([width, depth, height], center = true);
	}
}

module Pokets(box_width){
    start = -12 / 2;
    height = 5;
    thikness = 0.25;
    
    two_pokets = [
        [0, 0, height]
    ];

    four_pokets = [
        [0, 0, height],
        [start + 3 - thikness/2, 0, height],
        [-start - 3 + thikness/2, 0, height],
    ];
    
    for (a = four_pokets)
		translate(a)
			cube([thikness, depth, height], center = true);
}

module Pins(){
    pin_radius = 0.1;
    
    rotate(a=90, v=[1,0,0]) { 
	cylinder(h=depth, r=pin_radius, center=true);
}
}

union(){
    Box(WIDTH, HEIGHT, DEPTH);
	Pokets(WIDTH);
	Pins();
	

	
}



