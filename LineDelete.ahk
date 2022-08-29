LineDelete(Str, Pos, EndPos := "", Opts := "", ByRef Match := ""){
	If (Pos = "" || Pos = 0 || Pos * 1 = "")
		Return Str
	LF := (inStr(Str, "`r`n")) ? ("`r`n")
		: (inStr(Str, "`n")) ? ("`n") : ("")
	L := StrLen(LF)
	Str := LF . StrReplace(Str, LF, LF, NumLines) . LF
	NumLines := (SubStr(Str, 0) != LF) ? (++NumLines) : (++NumLines)
	Pos := (Pos < 0 && Pos >= -NumLines) ? (Pos + NumLines + 1)
		 : (Pos < -NumLines || Pos > NumLines) ? ("") : (Pos)
	EndPos := (Pos = "" || EndPos * 1 = "" || EndPos = 0
			   || EndPos < -NumLines || EndPos > NumLines) ? ("")
			: (EndPos < 0) ? (EndPos + NumLines + 1) : (EndPos)
	(EndPos != "" && EndPos < Pos)
			 ? (Tmp := Pos, Pos := EndPos, EndPos := Tmp, Tmp := "")
	Opts := ((Opts != "B" && Opts != "") || (Pos = EndPos && Opts = "B")
			 || (EndPos = "" && Opts = "B")) ? ("") : (Opts)
	StartMatch := (Opts = "") ? (InStr(Str, LF,,, Pos) + L)
				: (InStr(Str, LF,,, Pos + 1) + L)
	EndMatch := (EndPos = "" && Opts = "") ? (InStr(Str, LF,,, Pos + 1))
			  : (EndPos != "" && Opts != "") ? (InStr(Str, LF,,, EndPos))
			  : (InStr(Str, LF,,, EndPos + 1))
	Match := ((EndPos - Pos = 1 && Opts = "B")
			  || Pos = "") ? ("")
		   : (SubStr(Str, StartMatch, EndMatch - StartMatch))
	Str := SubStr(SubStr(Str, 1, StartMatch - 1)
	    . SubStr(Str, EndMatch + L), L + 1, -L)
	Return Str
}