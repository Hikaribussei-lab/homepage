                                                                                                                                                                          #include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "skies.inc"
    
 
//view 
camera {
  location  <6, 9,-15>
  look_at   <0.0, 0, 0.0>
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
background {rgbt<1, 1, 1, 0>}



//cone1
isosurface {
  function {2*sqrt(x*x + z*z)-y}
  contained_by {box{<-1,0,-1>, <1,1,1>} }
  max_gradient 3
  open
  no_shadow  
    texture {
    pigment { color rgbt <0.5, 0 , 0.1, 0.1>}
    finish {
      diffuse 0.4
      specular 0.5
    }
    }
    translate<0.5, 0, 0.5>
}
isosurface {
  function {2*sqrt(x*x + z*z)-y}
  contained_by {box{<-1,0,-1>, <1,1,1>} }
  max_gradient 3
  open
  no_shadow  
    texture {
    pigment { color rgbt <0.9, 0 , 0.1, 0.1>}
    finish {
      diffuse 0.4
      specular 0.5
    }
    }
    rotate<0, 0, 180>
    translate<0.5, 0, 0.5>
}
sphere{
  <0,0,0>, 0.1
       texture {
             pigment  {rgbt<1,0.0,0,0.15>}
             finish
                 {diffuse 0
                  brilliance 2
                  ambient 0.6
                  phong 0 phong_size 250
                  specular 0.15  roughness 0.02
                  }
               }
          no_shadow 
          translate<0.5, 0, 0.5>
          }


//cone2
isosurface {
  function {2*sqrt(x*x + z*z)+y}
  contained_by { box{<-1,-1,-1>, <1,-0,1>} }
  max_gradient 3
    open
  no_shadow
    texture {
    pigment { color rgbt <0.1, 0.0 0.9, 0.1>}
    finish {
      diffuse 0.4
      specular 0.5
    }
    }
    translate<-0.5, 0, -0.5>
}
isosurface {
  function {2*sqrt(x*x + z*z)+y}
  contained_by { box{<-1,-1,-1>, <1,-0,1>} }
  max_gradient 3
    open
  no_shadow
    texture {
    pigment { color rgbt <0.1, 0.0 0.9, 0.1>}
    finish {
      diffuse 0.4
      specular 0.5
    }
    }
    rotate<0, 0, 180>
    translate<-0.5, 0, -0.5>
}
sphere{
  <0,0,0>, 0.1
       texture {
             pigment  {rgbt<0,0.0,1,0.15>}
             finish
                 {diffuse 0
                  brilliance 2
                  ambient 0.6
                  phong 0 phong_size 250
                  specular 0.15  roughness 0.02
                  }
               }
          no_shadow 
          translate<-0.5, 0, -0.5>
          }


union{
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
translate<-0.5, 0.4, -0.5>
}
union{
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
rotate<0, 0, 180>
translate<-0.5, -0.4, -0.5>
}




union{
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
rotate<0, 0, 90>
translate<-0.5-0.4, 0, -0.5>
} 
union{
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
rotate<0, 0, -90>
translate<-0.5+0.4, 0, -0.5>
}




union{
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
rotate<0, 0, 90>
rotate<0, 90, 0>
translate<-0.5, 0, -0.5+0.4>
} 
union{
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
rotate<0, 0, 90>
rotate<0, -90, 0>
translate<-0.5, 0, -0.5-0.4>
}


union{
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
rotate<0, 0, 90>
rotate<0, 45, 0>
translate<-0.5-0.3, 0, -0.5+0.3>
} 
union{
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
rotate<0, 0, 90>
rotate<0, -45, 0>
translate<-0.5-0.3, 0, -0.5-0.3>
}
 
union{
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
rotate<0, 0, 90>
rotate<0, 135, 0>
translate<-0.5+0.3, 0, -0.5+0.3>
} 
union{
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
rotate<0, 0, 90>
rotate<0, -135, 0>
translate<-0.5+0.3, 0, -0.5-0.3>
}
























union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.2, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
translate<-0.5, 0.4, -0.5>
translate<1, 0, 1>
}
union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0, 0>
  rotate<0,360/6-30,180>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 180>
translate<-0.5, -0.4, -0.5>
translate<1, 0, 1>
}




union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.3, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 90>
translate<-0.5-0.4, 0, -0.5>
translate<1, 0, 1>
} 
union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.3, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, -90>
translate<-0.5+0.4, 0, -0.5>
translate<1, 0, 1>
}




union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.3, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 90>
rotate<0, 90, 0>
translate<-0.5, 0, -0.5+0.4>
translate<1, 0, 1>
} 
union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.3, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 90>
rotate<0, -90, 0>
translate<-0.5, 0, -0.5-0.4>
translate<1, 0, 1>
}


union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.3, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 90>
rotate<0, 45, 0>
translate<-0.5-0.3, 0, -0.5+0.3>
translate<1, 0, 1>
} 
union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.3, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 90>
rotate<0, -45, 0>
translate<-0.5-0.3, 0, -0.5-0.3>
translate<1, 0, 1>
}
 
union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.3, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 90>
rotate<0, 135, 0>
translate<-0.5+0.3, 0, -0.5+0.3>
translate<1, 0,1>
} 
union{
object{
  Cone_Y 
  scale 0.07
  no_shadow
  translate<0, 0.3, 0>
  rotate<180,360/6-30,0>
  pigment{color Red}
  finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.25, 0>, 0.03 
   no_shadow
   pigment{color Red}
   translate<0, 0, 0>
   rotate<0,360/6-30,0>
   finish {
      ambient rgb <0.1, 0, 0>
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 90>
rotate<0, -135, 0>
translate<-0.5+0.3, 0, -0.5-0.3>
translate<1, 0, 1>
}



