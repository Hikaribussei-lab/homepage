#version 3.7;
#include "colors.inc"
#include "analytical_g.inc"
global_settings{ charset utf8 }     
         
camera
{  
orthographic
//perspective
//location< 15, 12, -8> 
location< 16, 10, -10>  
look_at  <0,0,0>    
}

light_source  {  <100,50,-20> color White shadowless}         
             
#default { 
    texture {
        finish
       {  diffuse 0.65
          brilliance 1
          ambient 0.1  reflection 0
          phong 0.0 phong_size 250
          specular 0.1  roughness 0.02
        }
     } 
  }  
       

background{rgbt<1, 1, 1, 0>}


//Bloch sphere
sphere   {
  <0,0,0>, 10
       texture {
             pigment  {rgbt<0.6,0.6,0.6,0.7>}
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


disc {
    <0,0,0>, y, 10
    texture {
             pigment  {rgbt<0.3,0.3,0.3,0.5>}
             finish
                 {diffuse 0
                  brilliance 1
                  ambient 0
                  phong 0.0 phong_size 250
                  specular 0.15  roughness 0.02 
                  }
               }  
          no_shadow
          }

torus {10, 0.04
	texture {
             pigment  {rgbt<0,0,0,0>}
             finish
                 {diffuse 0.5
                  brilliance 1
                  ambient 0.3  reflection 0.05
                  phong 0.0 phong_size 250
                  specular 0.15  roughness 0.02
                  }
               } 
          }


intersection{
torus {10, 0.04
	texture {
             pigment  {rgbt<0,0,0,0>}
             finish
                 {diffuse 0.5
                  brilliance 1
                  ambient 0.3  reflection 0.05
                  phong 0.0 phong_size 250
                  specular 0.15  roughness 0.02
                  }
               }
          rotate <0,0,90>
          //rotate <0,-20,0>       
          }
box{-10,10 pigment{rgb<0,0,0>} translate<0, 0, -10>}
}


intersection{
    box{-10,10 pigment{rgb<0,0,0>} translate<10, 0, -10>}
    torus {10, 0.04 pigment{rgb<0,0,0>} rotate <90, 0, 00>}
}

   
object{
   sphere{<0, 0, 0>, 1.8}
   pigment{ rgbt<0.1,0.3,0.1,0.0>}

       finish{
       phong 0.8
       reflection 0.05
       diffuse 1
       specular 0.5
       brilliance 0.5
       }
       translate <0, 0, 0>
       no_shadow
       }

// x-axis 
union {
cylinder {
  -11*z,  11*z,  0.1 
       }
cone{
  -12*z, 0, -11*z, 0.3
    }
pigment {rgbt<1, 0, 0, 0.4>} 
no_shadow
//translate <0,0,0>            
      }  // end of union
                
// z-axis  
union {
cylinder {
  -11*x,  11*x,  0.1   
         }
cone{
 12*x, 0, 11*x, 0.3
    }
pigment {rgbt<0,0,1,0.4>} 
no_shadow              
      }  // end of union    

// y-axis  
union {
cylinder {
  -11*y,  11*y,  0.1  
        }
cone{
 12*y, 0, 11*y, 0.3
    }
pigment {rgbt<0,1,0, 0.4>} 
no_shadow                                            
      }  // end of union
     



//**************************************************************        
        
                                                       
#local P  = <-10, 0, 0>; //#1       
object{ Vector (0, P, 0.3)
         pigment{  rgbt<1,0,0, 0>}
         //rotate<0, a, 0>
         }   

#local P  = <7.5, 7.5, 0>; //#2 
object{ Vector (0, P, 0.3)                    
         pigment{  rgbt<1,0,0, 0.3>}
         //rotate<0, a, 0>
         }
           
#local P  = <7.5, 7.5, 0>; //#3 
object{ Vector (0, P, 0.3)
         pigment{  rgbt<1,0,0, 0.5>}
         //rotate<0, a, 0>} 
         }
         
#local P  = <10, 0,	0>; //#4  
object{ Vector (0, P, 0.3)
         pigment{  rgbt<1,0,0, 0.6>}
         //rotate<0, a, 0>}
         }
