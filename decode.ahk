FileRead,stringorgional,Passwords.txt
Loop
{
    stringnew := StrReplace(stringorgional, "`r`n`r`n", "`r`n", Count)
    if (Count = 0)  ; No more replacements needed.
        break
}
FileAppend,%stringnew%,newpass.txt
