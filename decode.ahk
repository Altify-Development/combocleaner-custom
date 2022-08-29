#Include %A_ScriptDir%\lib\LineDelete.ahk
FileRead,stringorgional,Passwords.txt
strToFind := "Hostname"
Loop, read, Passwords.txt
{
         IfInString, A_LoopReadLine, %strToFind%
            {
               Output := LineDelete(Var, %A_Index%)
             }
}
Loop
{
    stringnew := StrReplace(stringorgional, "`r`n`r`n", "`r`n", Count)
    if (Count = 0)  ; No more replacements needed.
        stringorgional := StrReplace(stringnew, "Username:%A_Space%", "", Count)
        if (Count = 0)  ; No more replacements needed.
            stringnew := StrReplace(stringorgional, "`nPassword:%A_Space%", ":", Count)
            if (Count = 0)  ; No more replacements needed.
}
FileAppend,%stringnew%,newpass.txt
