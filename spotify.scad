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
  bottom(170,45,6);
  linear_extrude(height = 20, scale=1) import(file = filename, dpi = 96);
  translate([22.5,22.5,-1]) cylinder(d=30,h=20);
}
