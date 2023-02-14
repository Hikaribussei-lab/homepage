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