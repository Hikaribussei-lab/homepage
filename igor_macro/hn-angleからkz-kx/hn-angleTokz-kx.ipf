#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.

Function kz_vol()
    //set variables and waves
    Variable v=11, polar=0
    Variable kzstp = 0.02, fai=4.3
    String ahwvstr, efwvstr
    Prompt ahwvstr, "select hn-angle 3D", popup, WaveList ("*", ";", "DIMS:3D") 
    Prompt efwvstr, "select Fermi edge 1D", popup, WaveList ("*", ";", "DIMS:1D") 
    Prompt polar, "polar angle as normal (deg)"
    Prompt v, "innner potential (eV)"
    Prompt fai, "vacuum level (eV)"
    Prompt kzstp, "kz step"
    DoPrompt "kz volume window", ahwvstr, efwvstr, v, polar, kzstp, fai
    If(V_flag)
        abort
    Endif
    //get coordination of the hn-angle wave
    Wave/D ahwv=$ahwvstr, efwv=$efwvstr
    Variable ir = DimOffset(ahwv, 0), dr = Dimdelta(ahwv, 0), sr = DimSize(ahwv, 0), lr = ir + dr*(sr-1)
    Variable ic = DimOffset(ahwv, 1), dc = Dimdelta(ahwv, 1), sc = DimSize(ahwv, 1), lc = ic + dc*(sc-1)
    Variable iz = DimOffset(ahwv, 2), dz = Dimdelta(ahwv, 2), sz = DimSize(ahwv, 2), lz = iz + dz*(sz-1)
    Variable efsr= DimSize(efwv, 0), efmax=efwv[efsr-1], efmin = efwv[0]
    If(sz!=efsr)
    	DoAlert 0, "check the number of points alon z axis"
    	Abort
    Endif
    //set kz-kx dimensions
    	Variable kc = 0.512
    	//about energy dimension
    		Variable ekmax = efmax + lr
    		Variable ekmin = efmin+ir
    	//about kx dimension
    		Variable polright=lc-polar, polleft=ic-polar, kxright = kc*sqrt(ekmax)*sin(polright*pi/180), kxleft=kc*sqrt(ekmax)*sin(polleft*pi/180)//left(<0), right(>0), kx region
    		Variable polmax= max(abs(polright), abs(polleft)), kxstep = 0.512*sqrt(efmax)*cos(polleft*pi/180)*dc*pi/180
    	//about kz dimension
    		Variable kzmax = kc*sqrt(ekmax+v)
    		Variable kzmin = kc*sqrt(ekmin*cos(polmax*pi/180)^2+v)//define kz region
    	//Make kz box
    		Variable kznum = floor(abs(kzmax-kzmin)/kzstp), kxnum = floor(abs(kxright-kxleft)/kxstep)//calculate point number
    //make kz-kx 3D volume
    	Make/O/D/N = (sr, kxnum, kznum) $NameOfWave(ahwv)+"_kz"; Wave/D kzwv = $NameOfWave(ahwv)+"_kz"//make vloume ( angle - hn )
    	SetScale/P x, ir, dr, kzwv
    	SetScale/P y, kxleft, kxstep, kzwv
    	SetScale/P z, kzmin, kzstp, kzwv
    	kzwv=0
    //put numbers in the kz-kx 3D volume
   	 Variable i, j, k
   	 For(k=0; k<kznum; k+=1)//kz axis
       	//current kz
       	Variable ckz = kzmin + kzstp*k
       	For(i=0; i<sr-1; i+=1)//energy axis 
       		//curent binding energy
            Variable ce = dr*i + ir 
            For(j=0; j<kxnum; j+=1)//kx axis
        			//current kx
            	Variable ckx = kxleft + kxstep*j
            	//calculate hn and theta
               Variable hn = ((ckx)^2 + (ckz)^2-v*kc^2)/((kc)^2) - ce + fai
               Variable theta = asin(ckx/(kc*sqrt(hn+ce-fai)))*180/pi+polar
               //put numbers with data interporation
               If(ckx>0)
               		kzwv[i][j][k] =   (NumType(interp3D(ahwv, ce, theta, hn)) != 2) ? interp3D(ahwv, ce, theta, hn) : 0     
               else
               		kzwv[i][j][k] =   (NumType(interp3D(ahwv, ce, theta, hn)) != 2) ? interp3D(ahwv, ce, theta, hn) : 0 
               Endif                   
            Endfor
        Endfor
    Endfor
 End