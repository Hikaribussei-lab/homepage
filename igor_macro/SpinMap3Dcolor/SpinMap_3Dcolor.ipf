#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3		// Use modern global access method and strict wave access.

Function a2Dtoa3D()
	//put angle information for FS map
	Variable astart, astep
	Prompt astart, "angle start"
	Prompt astep, "angle step"
	DoPrompt "angle start and step for FS map", astart, astep
	If(V_flag==1)
		abort
	Endif
	//making 3D volume 
		String wvlist=WaveList("*", ";", "DIMS:2")//please change "*" if you want to pick up wave name
		Variable wvnum=ItemsInList(wvlist)//count the number of the waves 
		//defenition of the corrdination of FS map vol
		String fwvstr=StringFromList(0, wvlist); Wave/D fwv=$fwvstr
		Variable ir = DimOffset(fwv, 0), dr = DimDelta(fwv, 0), sr = DimSize(fwv, 0)
		Variable ic = DimOffset(fwv, 1), dc = DimDelta(fwv, 1), sc = DimSize(fwv, 1)
		//3D volume
		Make/O/D/N=(sr, sc, wvnum) vol; Wave/D vwv=vol
		SetScale/P x, ir, dr, vwv; SetScale/P y, ic, dc, vwv; SetScale/P z, ic, dc, vwv
		Variable i, j, k
		For(i=0; i<wvnum; i+=1)
			String cwvstr=StringFromList(i, wvlist); Wave/D cwv=$cwvstr
			vwv[][][i]=cwv[p][q]
	Endfor
End


//3D color map with RGB and makeing color scale table
Function color_test(intmap, polmap, sc)//spin color scale
	Wave/D intmap, polmap; Variable sc
	Variable v=0
	//making RGB volume: 0 layer=>R, 1 layer=>G, 2 layer=>B
		Make/O/D/N=(DimSize(intmap, 0), DimSize(intmap, 1), 3) matrgb
		SetScale/P x, DimOffset(intmap, 0), DimDelta(intmap, 0), matrgb
		SetScale/P y, DimOffset(intmap, 1), DimDelta(intmap, 1), matrgb 
		NewImage matrgb
	//set up for 3D color image
		Variable n1, n2, n3, i, j
		WaveStats/Q intmap; v_max=V_max
		matrgb=0
	//showing 3D color image
	For(i=0; i<DimSize(intmap, 0); i+=1)//energy axis
		For(j=0; j<DimSize(intmap, 1); j+=1)//angle axis
			//intensity (black)
			Variable nm_int = (intmap[i][j]-v)/(v_max-v)
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
	make_3Dcolor_table(sc)
End

Function make_3Dcolor_table(sc)
	Variable sc
	Make/O/D/N=(501, 501) pol_scale, int_scale
	Wave/D intmap=int_scale, polmap=pol_scale
	intmap=65535*x/500; polmap=-1+2*y/500; 
	Make/O/D/N=(DimSize(intmap, 0), DimSize(intmap, 1), 3) color_table
	WaveStats/Q intmap; v_max=V_max
	Setscale/I x, 0, v_max, color_table; Setscale/I y, -1, 1, color_table; 
	NewImage color_table
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
End


