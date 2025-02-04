                                                                                                                                                                                                          #include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "skies.inc"
    
 
//view 
camera {
  location  <0, 4,-12>
  look_at   <0.0, -0.2, 0.0>
  angle 16
}


//light from y direction
light_source {
  <0.8, 1, -2>color White  
}


//light from y direction
light_source {
  <0.8, -1.0, -2>color White
}


//back
background {color White}



//upper cone_trans
isosurface {
  function {x*x + z*z-y}
  contained_by {box{<-1,0,-1>, <1,1,1>} }
  max_gradient 3
  open
  no_shadow  
    texture {
    pigment { color rgbt <0.9, 0 , 0.1, 0.3>}
    finish {
      diffuse 0.4
      specular 0.5
    }
    }
    translate<0, -0.5, 0>
    scale<0.6, 1, 0.6>
}


//lower cone
isosurface {
  function {x*x +z*z+y}
  contained_by { box{<-1,-1,-1>, <1,1,1>} }
  max_gradient 3
    open
  no_shadow
    texture {
    pigment { color rgbt <0.1, 0.0 0.9, 0.3>}
    finish {
      diffuse 0.4
      specular 0.5
    }
    }
    scale<0.6, 1, 0.6>
}


/*
//upper cone_trans
isosurface {
  function {x*x + z*z- y+0.2}
  contained_by {box{<-1,0,-1>, <1,1,1>} }
  max_gradient 3
  open
  no_shadow  
    texture {
    pigment { color rgbt <0.9, 0 , 0.1, 0.6>}
    finish {
      diffuse 0.4
      specular 0.5
    }
    }
    translate<0, -0.1, 0>
}

//lower cone
isosurface {
  function {x*x +z*z+y+0.1}
  contained_by { box{<-1,-1,-1>, <1,-0,1>} }
  accuracy 0.0001
  max_gradient 3
    open
  no_shadow
    texture {
    pigment { color rgbt <0, 0.2, 0.8, 0.6 >}
    finish {
      ambient rgb <0.2, 0.2, 0.2>
      diffuse 0.3
      brilliance 0.5
      specular 0.5
    }
    }
  translate<0, 0.6, 0>
}
 

torus {0.48, 0.02
	texture {
             pigment  {rgbt<0,1,0,0.5>}
             finish
                 {diffuse 0.5
                  brilliance 1
                  ambient 0.3  
                  phong 0.0 phong_size 250
                  specular 0.15  roughness 0.02
                  }
               }
          translate<0, 0.3, 0>
          }

*/

/*
//arrow
#declare J=1;
#while(J<=6)


object{
  Cone_Y 
  rotate 90*z
  scale 0.07
  no_shadow
  translate<0,0.5,-0.5>
  rotate<0,360/6*J,0>
  pigment{color Red}
  finish {
      ambient rgb <0, 0, 0.1>
      diffuse 1
      brilliance 1
      specular 0.5
    }

}
cylinder {
   <0, 0, 0>,<0, -0.2, 0>, 0.02
   rotate 90*z
   no_shadow
   pigment{color Red}
   translate<0, 0.5,-0.5>
   rotate<0,360/6*J,0>
   finish {
      ambient rgb <0, 0, 0.1>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
 }


//down
 object{
  Cone_Y 
  rotate -90*x
  scale 0.07
  no_shadow
  translate<0,-0.7,-1.0>
  rotate<0,360/6*J-30,0>
  pigment{color Blue}
  finish {
      ambient rgb <0, 0, 0.1>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }

}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03
   rotate -90*x
   no_shadow
   pigment{color Blue}
   translate<0, -0.7,-1.0>
   rotate<0,360/6*J-30,0>
   finish {
      ambient rgb <0, 0, 0.1>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
 }

 object{
  Cone_Y 
  rotate -90*y
  rotate -45*x
  scale 0.07
  no_shadow
  translate<0,-0.3,-0.8>
  rotate<0,360/6*J-30,0>
  pigment{color Blue}
  finish {
      ambient rgb <0, 0, 0.1>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }

}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03
   rotate -90*y
   rotate -45*x
   
   no_shadow
   pigment{color Blue}
   translate<0, -0.3,-0.8>
   rotate<0,360/6*J-30,0>
   finish {
      ambient rgb <0, 0, 0.1>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
 }

#declare J=J+1;
#end


 object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0, 0>
  rotate<0,360/6-30,0>
  pigment{color Blue}
  finish {
      ambient rgb <0, 0, 0.1>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }

}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Blue}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0, 0, 0.1>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
 }
*/

/*
//lower plane
isosurface {
  function {y+0.6}
  contained_by { box {-0.7, 0.7} }
  max_gradient 3
    open
  no_shadow
    texture {
    pigment { color rgbt < 0, 0, 1, 0.5> }
    finish {
      ambient rgb <0.1, 0.1, 0.1>
      diffuse 0.9
      brilliance 1.0
      specular 0.8
    }
    

  }

}
 */
