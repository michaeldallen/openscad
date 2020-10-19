linear_extrude(height = 10, center = true, convexity = 10, twist = 0)
translate([2, 0, 0])
circle(r = 1);

rotate_extrude(convexity = 10)
translate([5, 0, 0])
circle(r = 1);

translate([0,60,0])
   rotate_extrude(angle=270)
       translate([40, 0]) circle(15);
rotate_extrude(angle=90, convexity=10)
   translate([20, 0]) circle(10);
translate([20,0,0]) 
   rotate([90,0,0]) cylinder(r=5,h=80);