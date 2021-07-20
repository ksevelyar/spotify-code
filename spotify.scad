filename = "ksevelyar.svg";
$fn = 256;

module fillet(edge,height) {
  translate([-edge/2, -edge/2, -1]) difference() {
    cube([edge,edge,height]);
    cylinder(h = height, d = edge);
  }
}

module bottom(x,y,h) {
  difference() {
    cube([x,y,h]);
    rotate([0,0,180]) fillet(10,h+2);
    translate([x,y,0]) fillet(10,h+2);
    translate([x,0,0]) rotate([0,0,-90]) fillet(10,h+2);
    translate([0,y,0]) rotate([0,0,90]) fillet(10,h+2);
  }
}

difference() {
  bottom(80,20,4);
  translate([-1,-0.3,-0.1]) linear_extrude(height = 5, scale=1) import(file = filename, dpi = 310);
  translate([9,10,-1]) cylinder(d=11,h=20);
}
