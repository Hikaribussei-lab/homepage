#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.

//main function
Function movie_vwv(vwv)//full path
	Wave/D vwv//volme wave
	Variable i, j, k
	
	//get x, y, z coordination of vwv
	Variable ir=DimOffset(vwv, 0), dr=DimDelta(vwv, 0), sr=DimSize(vwv, 0)
	Variable ic=DimOffset(vwv, 1), dc=DimDelta(vwv, 1), sc=DimSize(vwv, 1)
	Variable iz=DimOffset(vwv, 2), dz=DimDelta(vwv, 2), sz=DimSize(vwv, 2)
	
	//make a matrix for constant energy contours and show graph
	Make/O/D/N=(sc, sz) map; Wave/D mwv=map
	SetScale/P x, ic, dc, mwv; SetScale/P y, iz, dz, mwv 
	mwv[][]=vwv[p][q][0]
	
	//make a matrix for E-k map
	Make/O/D/N=(sr, sc) ekmap; Wave/D ekwv=ekmap
	SetScale/P x, ir, dr, ekwv; SetScale/P y, ic, dc, ekwv 
	ekwv[][]=vwv[p][q][70]
	
	//show graph
	GraphStyle(mwv, ekwv)
	
	//start making movie stacking
	NewMovie/Z/F=30 as NameOfWave(vwv)
	if(V_Flag==0)
		For(i=0; i<sr; i+=1)
			//calculate current energy position
			Variable ce = ir + i*dr
			//put data in the matrix
			mwv[][]=vwv[i][p][q]
			
			//add line to indicate of the current energy
			SetDrawEnv xcoord= bottom,ycoord= left,linefgc= (3,52428,1),linethick= 1.50
			DrawLine -22,ce,22,ce
			
			//add movie frame
			doUpdate
			AddMovieFrame
			
			//delete the line
			DrawAction delete		
		Endfor	
		CloseMovie
	endif
	//kill windows and wave
	If(WinType("mv_win") == 1)
		KillWindow mv_win
		KillWaves mwv, ekwv
	Endif
End

//show graph
Function GraphStyle(mwv, ekwv)
	Wave/D mwv, ekwv
	PauseUpdate; Silent 1		// modifying window...
	Display/N=mv_win/W=(50,50,550,350)/K=1 as "movie_window"
	Display/W=(0,0,300,300)/HOST=#
	AppendImage $NameOfWave(mwv)
	ModifyImage/Z $NameOfWave(mwv) ctab= {*,*,Grays256,1}
	ModifyGraph/Z tick=2
	ModifyGraph/Z mirror=1
	ModifyGraph/Z manTick(left)={0,5,0,0},manMinor(left)={4,0}
	ModifyGraph/Z manTick(bottom)={0,5,0,0},manMinor(bottom)={4,0}
	Label/Z left "\\Z12\\f02\\F'arial'k\\By\\M\\f00\\Z12 (Å\\S-1\\M)"
	Label/Z bottom "\\Z12\\f02\\F'arial'k\\Bx\\M\\f00\\Z12 (Å\\S-1\\M)"
	SetAxis/Z left -15.1,15.1
	SetAxis/Z bottom -15.1,15.1
	RenameWindow #,G0
	SetActiveSubwindow ##
	Display/W=(300,0,500,350)/HOST=#
	AppendImage $NameOfWave(ekwv)
	ModifyImage/Z $NameOfWave(ekwv) ctab= {*,*,Grays256,1}
	ModifyGraph/Z tick=2
	ModifyGraph/Z mirror=1
	ModifyGraph swapXY=1
	Label/Z left "\\Z12Kinetic energy (eV)"
	Label/Z bottom "\\Z12Slit angle (deg)"
	RenameWindow #,G1
End




	