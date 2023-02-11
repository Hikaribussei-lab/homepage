                                                                                                                                                                                                           #include "colors.inc"
#include "textures.inc"
#include "shapes.inc"
#include "metals.inc"
#include "glass.inc"
#include "skies.inc"
    
 
//view 
camera {
  location  <6, 5,-15>
  look_at   <0.0, 0, 0.0>
  angle 16
}                                   




//light from y direction
light_source {
  <0.8, 1, -2>color White  
}


//light from y direction
//light_source {
//  <0.8, -1.0, -2>color White
//}/


//back
background {rgbt<0, 0, 0, 1>}


sphere{
  <0,0,0>, 1
       texture {
             pigment  {rgbt<1,1.1,1,0.2>}
             finish
                 {diffuse 0
                  brilliance 2
                  ambient 0.6
                  phong 0 phong_size 250
                  specular 0.15  roughness 0.02
                  }
               }
          no_shadow 
          }
          
          
#declare K=0;
#while(K<=36)


union{          
#declare J=2;
#declare a=8;
#while(J<=a)
 
union{
object{
  Cone_Y 
  scale 0.08
  no_shadow
  translate<0,0,0>
  rotate<0,0,0>
  pigment{rgb<1-(J-1)/a, 0, (J-1)/a, 0>}
  finish {
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
cylinder {
   <0, 0, 0>,<0, -0.3, 0>, 0.03 
   no_shadow
   pigment{rgb<1-(J-1)/a, 0, (J-1)/a, 0>}
   translate<0, 0, 0>
   rotate<0,0,0>
   finish {
      diffuse 1
      brilliance 0.5
      specular 0.5
    }
}
rotate<0, 0, 180+180/a*(J-1)>
translate<1.3*sin(pi/a*(J-1)), 1.2-2.4/a*(J-1), 0>
} 

#declare J=J+1;
#end

rotate<0, 10*K, 0>
}

#declare K=K+1;
#end