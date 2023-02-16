#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.

Function SpinMap()
	//put angle information for FS map
	Variable astart=-15, astep=0.5, aend=15, sf=0.3
	Variable ch=2, sc=1
	Prompt astart, "angle start"
	Prompt astep, "angle step"
	Prompt aend, "angle end"
	Prompt sf, "Sherman function"
	Prompt ch, "angle step", popup, "white;black"
	Prompt sc, "color scaling" 
	DoPrompt "angle setting for spinMap", astart, astep, aend, sf, ch, sc
	If(V_flag==1)
		abort
	Endif
	
	//set spin channel
	String chstr
	If (ch==1)
		chstr = "*_w"
	Elseif(ch==2)
		chstr = "*_b"
	Endif
	
	//making 1D wave list
	String wvlist=WaveList(chstr, ";", "DIMS:1")//please change "*" if you want to pick up wave name
	wvlist = sortList(wvlist, ";", 16)
	Variable wvnum=ItemsInList(wvlist)//count the number of the waves 

	//defenition of the corrdination of SpinMap
	String fwvstr=StringFromList(0, wvlist); Wave/D fwv=$fwvstr
	Variable ir = DimOffset(fwv, 0), dr = DimDelta(fwv, 0), sr = DimSize(fwv, 0)
	Variable pnum = (aend-astart)/astep+1
	If(pnum!=wvnum/2)
		print pnum, wvnum
		DoAlert 0, "please check angle setting and wave numbers"
		Abort
	Endif

	//2D maps (int_pos_map, int_neg_map, total_int_map, spin_pol_map, spin_up_map, spin_dn_map)
	Make/O/D/N=(sr, pnum) int_pos_map; Wave/D ipwv=int_pos_map
	SetScale/P x, ir, dr, ipwv; SetScale/P y, astart, astep, ipwv
	Duplicate/O/D ipwv, int_neg_map; Wave/D inwv=int_neg_map
	Duplicate/O/D ipwv, total_int_map; Wave/D twv=total_int_map
	Duplicate/O/D ipwv, spin_pol_map; Wave/D spwv=spin_pol_map
	Duplicate/O/D ipwv,spin_up_map; Wave/D uwv=spin_up_map
	Duplicate/O/D ipwv,spin_dn_map; Wave/D dwv=spin_dn_map
	Variable i, j, k
	
	//put values	
	For(i=0; i<pnum; i+=1)
		String pwvstr=StringFromList(i, wvlist); Wave/D pwv=$pwvstr
		String nwvstr=StringFromList(i+pnum, wvlist); Wave/D nwv=$nwvstr
		ipwv[][i]=pwv[p]; inwv[][i]=nwv[p]
	Endfor
	
	//calculate spin maps
	twv=ipwv+inwv; spwv=(ipwv-inwv)/twv/sf; dwv=1/2*(1-spwv)*twv; uwv=1/2*(1-spwv)*twv
	Killwaves ipwv, inwv
	
	//make spinMap in 3D color scale
	Wave/D image=color3D_test(twv, spwv, sc)
	
	//make 3D color table 
	Wave/D ctable=make_3Dcolor_table(sc)
	
	//show in graph
	color_map(image, ctable) 
End


//3D color map with RGB 
Function/WAVE color3D_test(intmap, polmap, sc)//spin color scale
	Wave/D intmap, polmap; Variable sc
	
	//making RGB volume: 0 layer=>R, 1 layer=>G, 2 layer=>B
	Make/O/D/N=(DimSize(intmap, 0), DimSize(intmap, 1), 3) matrgb
	SetScale/P x, DimOffset(intmap, 0), DimDelta(intmap, 0), matrgb
	SetScale/P y, DimOffset(intmap, 1), DimDelta(intmap, 1), matrgb 
	
	//set up for 3D color image
	Variable n1, n2, n3, i, j
	WaveStats/Q intmap; v_max=V_max
	matrgb=0
	
	//showing 3D color image
	For(i=0; i<DimSize(intmap, 0); i+=1)//energy axis
		For(j=0; j<DimSize(intmap, 1); j+=1)//angle axis
			//intensity (black)
			Variable nm_int = (intmap[i][j])/(v_max)
			//polarization with scaling
			Variable pol = polmap[i][j]*sc
			If(polmap[i][j] >=0)
				matrgb[i][j][1]= 65535-65535*(nm_int)
				matrgb[i][j][2]= 65535-65535*(nm_int)
				If(sqrt((1-nm_int)^2+pol^2) <= 1)
					matrgb[i][j][0]= 65535*sqrt(((1-nm_int)^2+pol^2))
				else
					matrgb[i][j][0]= 65535
				endif
			Else
				matrgb[i][j][0]= 65535-65535*(nm_int)
				matrgb[i][j][1]= 65535-65535*(nm_int)
				If(sqrt((1-nm_int)^2+pol^2) <= 1)
					matrgb[i][j][2]= 65535*sqrt(((1-nm_int)^2+pol^2))
				else
					matrgb[i][j][2]= 65535
				endif
			Endif
		Endfor
	Endfor
	return matrgb
End

//make color scale table
Function/WAVE make_3Dcolor_table(sc)
	Variable sc
	Make/O/D/N=(501, 501) pol_scale, int_scale
	Wave/D intmap=int_scale, polmap=pol_scale
	intmap=65535*x/500; polmap=-1+2*y/500; 
	Make/O/D/N=(DimSize(intmap, 0), DimSize(intmap, 1), 3) color_table
	WaveStats/Q intmap; v_max=V_max
	Setscale/I x, 0, v_max, color_table; Setscale/I y, -1, 1, color_table; 
	Variable n1, i, j
	color_table=0
	For(i=0; i<DimSize(intmap, 0); i+=1)
		For(j=0; j<DimSize(intmap, 1); j+=1)
			Variable nm_int = (intmap[i][j])/(v_max)
			Variable pol = polmap[i][j]*sc
			If(polmap[i][j] >=0)
				color_table[i][j][1]= 65535-65535*(nm_int)
				color_table[i][j][2]= 65535-65535*(nm_int)
				If(sqrt((1-nm_int)^2+pol^2) <= 1)
					color_table[i][j][0]= 65535*sqrt(((1-nm_int)^2+pol^2))
				else
					color_table[i][j][0]= 65535
				endif
			Else
				color_table[i][j][0]= 65535-65535*(nm_int)
				color_table[i][j][1]= 65535-65535*(nm_int)
				If(sqrt((1-nm_int)^2+pol^2) <= 1)
					color_table[i][j][2]= 65535*sqrt(((1-nm_int)^2+pol^2))
				else
					color_table[i][j][2]= 65535
				endif
			Endif
		Endfor
	Endfor
	return color_table
End


//graph macro
Function color_map(image, ctable) 
	Wave/D image, ctable
	Display /W=(311,119,718,429)/K=1  as "color_map"
	Display/W=(0,0,300,300)/HOST=# 
	AppendImage image
	ModifyGraph tick=2
	ModifyGraph mirror=1
	ModifyGraph manTick(left)={0,5,0,0},manMinor(left)={4,0}
	ModifyGraph manTick(bottom)={0,0.1,0,1},manMinor(bottom)={4,0}
	Label left "\\Z12\\F'arial'DA theta x (deg)"
	Label bottom "\\Z12\\F'arial'Kinetic energy (eV)"
	SetAxis left -15.1,15.1
	SetAxis bottom 0.9,1.31
	ModifyGraph swapXY=1
	RenameWindow #,G0
	SetActiveSubwindow ##
	Display/W=(300,0,500,350)/HOST=# 
	AppendImage ctable
	ModifyGraph margin(left)=44,margin(top)=141,margin(right)=42
	ModifyGraph tick=2
	ModifyGraph mirror=1
	ModifyGraph lblMargin(left)=4,lblMargin(bottom)=6
	ModifyGraph lblLatPos(bottom)=-1
	Label left "\\Z12Spin polarization"
	Label bottom "\\Z12Intensity"
	SetAxis left -1,1
	RenameWindow #,G1
	SetActiveSubwindow ##
EndMacro
