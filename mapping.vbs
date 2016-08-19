
'This file creates the ascii based game grid and updates character movement

Option Explicit

Dim posX, posY, args, strterrain
Dim filename, file, linecopy
Dim MapSize
Dim FSO

'Mapsize :: height
MapSize = 44
filename = "foo.txt"

If Wscript.Arguments.Count = 0 Then
posY= 10
posX= 20
else
posX= Wscript.arguments(0)
posY= Wscript.arguments(1)
end if

Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.OpenTextFile(filename)
Dim i
Dim output

Do Until file.AtEndOfStream
Dim line
line= file.Readline
if i=posY Then
	set output= Update(posX,posY,line) 
Else
Wscript.Echo line
End if
i= i+1
Loop
' Wscript.Echo posY
' ************ Update() starts here*********************
Function Update(ByVal myX, ByVal myY, myline )
NumLen=len(myline)
Lstr=(Left(myline,myX))
Rstr=(right(myline,(NumLen-myX)))

Wscript.Echo "left:"+Lstr+" right:"+Rstr
Wscript.Echo "Length"+NumLen


' myline=line+"<"
' myLine= myMap.readline
' wscript.echo myLine

' dim count
' for count = 0 to index
' myMap.SkipLine
' Next


End Function 

' dim length
' dim mytemplength
' dim myTemp, tempstring

' mytemplength= len(myLine) 
' myTemp= posX - mytemplength

' if (myTemp > 0) Then
' tempstring= String(myTemp," ")
' myLine= myLine&tempstring
' End if

' length= len(myLine)
' strterrain= replace(myLine," ",".",1)
' shortlength= posX - 1
' wscript.echo "1st line" & firstline 

' dim rightlength
' rightlength= length- posX
' firstline= Left(strterrain,shortlength)
' secondline= Right(strterrain,rightlength)
' strterrain= firstline & ":)" & secondline
' MapMe = strterrain

