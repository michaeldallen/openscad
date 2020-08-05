/******************************************************************************/
/**********                     INFO                                 **********/
/******************************************************************************/

/*
Wall Mount Test lead Hanger Rev 1.1 March 2016
you can adjust the number of fingers, length and gap.  
The wall mount piece will auto adjust total width to accommodate the above parameters
by David Buhler

1.1
-added hole size fix for small finger gaps and large wall mount hole size
-fixed minimum finger length support cylinder length
-adjusted variable settings for customizer so user input doesn't create wierd holes and gaps
-added side trimming to reduce size and plastic use.

*/

/******************************************************************************/
/**********                     Settings                             **********/
/******************************************************************************/
//adjust the follow to meet your needs,  all measurements in mm.

/* [BACK] */
//Height of wall mounting plate
back_height=20;//[12:50]

//Mounting plate thickness
back_thickness=5;//[3:10] 

/* [FINGERS] */
//Finger slope(degrees)
back_tilt=3;//[0:8]

//Number of fingers
numberof_fingers=5;//[3:15]

//Slot length
finger_length=50;//[20:100]

//determines weight holding ability
finger_thickness=4; //[2:7]

//how much room for the clips
finger_width=5; //[5:20]

//how wide the slot will be(cable thickness)
finger_gap=5;//[1:15]

/* [SCREW-HOLES] */
//add mounting holes?
mount_holes="yes";//[yes,no]

//thread size in mm
hole_size=3;//[1:6]

/* [FINGER SHAPE] */
//select one the the two following finger shapes
finger_shape="round";//[round,square]
//Trim the sides?
trim_sides= "no"; // [yes,no]


/* [BUILD PLATE] */
//for display only, doesn't contribute to final object
build_plate_selector = 3; //[0:Replicator 2,1: Replicator,2:Thingomatic,3:Manual]
//when Build Plate Selector is set to "manual" this controls the build plate x dimension
build_plate_manual_x = 200; //[100:400]
//when Build Plate Selector is set to "manual" this controls the build plate y dimension
build_plate_manual_y = 200; //[100:400]
build_plate(build_plate_selector,build_plate_manual_x,build_plate_manual_y);

/******************************************************************************/
/**********                   Variable Calcs                         **********/
/****placement of the finger support structure, no need to adjust these********/
/******************************************************************************/
/* [HIDDEN] */
s_width=finger_width/6; //Support triangle width  could just make a fixed width rather than based on finger width
s_height=back_height/2.5;//Support triangle height based on the back height
s_length=finger_length/3*2;//Support triangle lenght based on the finger length 
s_placement_x=(finger_width/2)-(s_width/2);//where to place the X starting point of the support 
s_placement_y=back_thickness/3; //where to place the Y starting point of the support, /3 to accommodate the back tilt 
s_placement_z=finger_thickness;//where to place the Z starting point of the support 


/******************************************************************************/
/**********                  Make It Happen Stuff                    **********/
/******************************************************************************/

echo ("Project Size (wide x height x finger length " ,numberof_fingers*(finger_width+finger_gap)," x ",back_height," x ",finger_length+back_thickness);

//centre the whole project on x0,y0
rotate ([0,0,180])translate ([-(numberof_fingers*(finger_width+finger_gap))/2,-finger_length/2,0])
    {
    difference()//had to stick three difference calls to trim sides.  weird!
        { 
       if (mount_holes=="yes")
            {
            rotate ([back_tilt,0,0]) 
                difference()
                {
                cube([(numberof_fingers*(finger_width+finger_gap)),back_thickness,back_height]);//make plate with auto width based on fingers+width+gap
                Holes ();
                };
            }
        else
            {
            rotate ([back_tilt,0,0]) 
                cube ([(numberof_fingers*(finger_width+finger_gap)),back_thickness,back_height]);//make plate with auto width based on fingers+width+gap
        }
    trim_sides();
    }
    for (inc=[finger_gap/2:finger_width+finger_gap:(numberof_fingers*(finger_width+finger_gap))-finger_gap]) //auto gen each finger and support placement distance
        {
        difference()//had to stick three difference calls to trim sides.  weird!
            {
        if (finger_shape=="round")
            {
            finger(inc,finger_thickness,finger_width,finger_length);//for rounded couner fingers
            }
        else if(finger_shape=="square")
            {
            translate ([inc,0,0])cube ([finger_width,finger_length,finger_thickness]);//for square fingers
            }
           trim_sides();
           }
         difference()//had to stick three difference calls to trim sides.  weird!
           {
           hull ()//created the support surface along with the rounded edge
            {
            difference ()
                {
                translate ([inc-s_width/2+finger_width/2,s_placement_y,s_placement_z])
                    cube ([s_width,s_length,s_height]);
                rotate ([-atan(s_height/s_length),0,0]) 
                    translate ([inc-.1-s_width+finger_width/2,0-back_thickness,s_height+finger_thickness-.2])
                    cube ([s_width*2,s_length*2,s_height*2]);  
                }
            translate ([inc+s_placement_x+s_width/2,s_placement_y,s_height+finger_thickness]) 
                rotate ([-atan(s_height/s_length)-90,0,0]) 
                cylinder(r=s_width/2,h=s_length+2,$fn=50); 
             }    
            trim_sides();
           }
        }
    }
    
//trims the side of the block to reduce size and unneeded support
module trim_sides()
    {
     if (trim_sides=="yes")
        {
        translate ([-finger_width/2,-5,-0.1]) 
            cube ([finger_width,finger_length+back_thickness+5,back_height+5]);
        translate ([((numberof_fingers)*(finger_width+finger_gap))-finger_gap-finger_width/2,-5,-0.1]) 
            cube ([finger_width,finger_length+back_thickness+5,back_height+5]);   
        }
     }
//creates the rounded fingers
module finger(position,thickness,width,length){
    hull(){
       rotate([-90,0,0])
            translate ([position+thickness/2,-thickness/2,0]) 
            cylinder (r=thickness/2,h=length,$fn=50);//left cylinder
       rotate([-90,0,0])
            translate ([position+width-thickness/2,-thickness/2,0]) 
            cylinder (r=thickness/2,h=length,$fn=50);//right cylinder 
       translate ([position,0,0])
            cube ([width,length,thickness/2]);//flat bottom (top when hanging)
    }
    
}
//creates the hole slots and placement based on number of fingers
module Holes ()
    {
    hole_size= hole_size*3 > back_height ? floor(back_height/5):hole_size; 
    hole_size= hole_size > finger_gap ? finger_gap:(hole_size==finger_gap ? hole_size-1:hole_size);
    if (numberof_fingers<7)
        {
        hull()
            { 
            rotate ([-90,0,0]) 
                translate([finger_width+(finger_gap/2) + finger_gap/2,(-back_height/5*2)-hole_size-2,-2]) 
                cylinder(r=hole_size,h=50,$fn=40);    
            rotate ([-90,0,0]) 
                translate([finger_width+(finger_gap/2) + finger_gap/2,-back_height/5*2,-2]) 
                cylinder(r=hole_size/2,h=50,$fn=40);   
            }
       hull()
            { 
            rotate ([-90,0,0]) 
                translate([((numberof_fingers-1)*(finger_width+finger_gap)),-back_height/5*2-hole_size-2,-2])        
                cylinder(r=hole_size,h=50,$fn=40);    
            rotate ([-90,0,0]) 
                translate([((numberof_fingers-1)*(finger_width+finger_gap)),-back_height/5*2,-2]) 
                cylinder(r=hole_size/2,h=50,$fn=40);   
            }
         } 
     else if (numberof_fingers>6)
        {
        hull()
            { 
            rotate ([-90,0,0]) 
                translate([(finger_width+finger_gap)*2-finger_gap/2,-back_height/5*2-hole_size-2,-2]) 
                cylinder(r=hole_size,h=50,$fn=40);    
            rotate ([-90,0,0]) 
                translate([(finger_width+finger_gap)*2-finger_gap/2,-back_height/5*2,-2]) 
                cylinder(r=hole_size/2,h=50,$fn=40);   
            }
       hull()
            { 
            rotate ([-90,0,0]) 
                translate([((numberof_fingers-2)*(finger_width+finger_gap))-finger_gap/2,-back_height/5*2-hole_size-2,-2])        
                cylinder(r=hole_size,h=50,$fn=40);    
            rotate ([-90,0,0]) 
                translate([((numberof_fingers-2)*(finger_width+finger_gap))-finger_gap/2,-back_height/5*2,-2]) 
                cylinder(r=hole_size/2,h=50,$fn=40);   
            }
         }    
     }
     
//display build plate on screen for reference 
module build_plate(bp,manX,manY){

		translate([0,0,-.52]){
			if(bp == 0){
				%cube([285,153,1],center = true);
			}
			if(bp == 1){
				%cube([225,145,1],center = true);
			}
			if(bp == 2){
				%cube([120,120,1],center = true);
			}
			if(bp == 3){
				%cube([manX,manY,1],center = true);
			}
		
		}
		translate([0,0,-.5]){
			if(bp == 0){
				for(i = [-14:14]){
					translate([i*10,0,0])
					%cube([.5,153,1.01],center = true);
				}
				for(i = [-7:7]){
					translate([0,i*10,0])
					%cube([285,.5,1.01],center = true);
				}	
			}
			if(bp == 1){
				for(i = [-11:11]){
					translate([i*10,0,0])
						%cube([.5,145,1.01],center = true);
				}
				for(i = [-7:7]){
					translate([0,i*10,0])
						%cube([225,.5,1.01],center = true);
				}
			}
			if(bp == 2){
				for(i = [-6:6]){
					translate([i*10,0,0])
						%cube([.5,120,1.01],center = true);
				}
				for(i = [-6:6]){
					translate([0,i*10,0])
						%cube([120,.5,1.01],center = true);
				}
			}
			if(bp == 3){
				for(i = [-(floor(manX/20)):floor(manX/20)]){
					translate([i*10,0,0])
						%cube([.5,manY,1.01],center = true);
				}
				for(i = [-(floor(manY/20)):floor(manY/20)]){
					translate([0,i*10,0])
						%cube([manX,.5,1.01],center = true);
				}
			}
		}
}