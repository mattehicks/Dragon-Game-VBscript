@setlocal
@set _pf=%ProgramFiles%
@if not "[%ProgramFiles(x86)%]"=="[]" set _pf=%ProgramFiles(x86)%
::previous lines insure 32 bit mode.

@echo off
mode con:cols=110 lines=100
:: ANSI ON
SetLocal EnableDelayedExpansion

set /a count=0
set /a hours=0
set /a timer1= 0
set /a timer2= 0
set drgn= awake
set input = nothing
::set report = "A dragon is nigh!"
set /a x= 1
set /a y= 1
set /a move= 1
set tab="         "
::echo "Dragons Lance: Stats"> output.txt
color 04
for %%A in (+ + + + + + + + + + + + + + + + + + + ) do (echo.)
echo                  ********************************************************
echo.  
echo.  
echo                                 WELCOME TO THE DRAGON'S LAIR... 
echo.  
echo.  
echo                  ********************************************************
color 02
::sleep.vbs 250 
::echo | set /p=.                                   * 
::sleep.vbs 500
::echo | set /p= * 
::sleep.vbs 500
::echo | set /p= * 
::sleep.vbs 500
::echo | set /p= * 
::sleep.vbs 500
::echo | set /p= * 
::sleep.vbs 500
::echo | set /p= * 
::sleep.vbs 500
::echo | set /p= * 
::sleep.vbs 500
::echo | set /p= * 
::sleep.vbs 500
::echo | set /p= * 	
::sleep.vbs 500

cls
:spin ::roll dice

type %drgn%.txt

Call :Color F !hours! 
Call :Color F " hours has passed..."
::Call :Color C %dragonstate%   

if defined ( %count% )
set /a count=count + 1
set /a timer1 = !hours! %% 2
set /a timer2 = !hours! %% 3
if %timer1% == 0 (
::set dragonstate=  The dragon is SLEEPING...
set drgn=sleep
Call :Color A "The dragon is SLEEPING..."
)
if %timer2%==0 (
::set ^dragonstate=  The dragon is AWAKE!
set drgn=awake
Call :Color C "The dragon is AWAKE!"
)
set /a time = !count! %% 24
if !time!== 0 (
set /a hours=!hours!+1
)
echo .

cscript //nologo mapping.vbs %x% %y%

set input = WScript.StdIn.Read(1)
echo Input: %input%

::if %y% == 33 ( set /a move= -1)
::
::if %y% == 0 (set /a move= 1)
::rem set /a x = x +1
::set /a y = y + %move%

:: count your coins...
:: call dynamics.bat

sleep.vbs 5

::pause
cls
goto spin


:Color
:: v21
:: Arguments: hexColor text [\n] ...
:: \n -> newline ... -> repeat
:: Supported in windows XP, 7, 8.
:: In XP extended ascii characters are printed as dots.
:: For print quotes, use empty text.
SetLocal EnableExtensions EnableDelayedExpansion
Subst `: "!Temp!" >Nul &`: &Cd \
SetLocal DisableDelayedExpansion
If Not Exist `.7 (
Echo(|(Pause >Nul &Findstr "^" >`)
Set /P "=." >>` <Nul	
For /F "delims=;" %%# In (
'"Prompt $H;&For %%_ In (_) Do Rem"') Do (
Set /P "=%%#%%#%%#" <Nul >`.3
Set /P "=%%#%%#%%#%%#%%#" <Nul >`.5
Set /P "=%%#%%#%%#%%#%%#%%#%%#" <Nul >`.7))
:__Color
Set "Text=%~2"
If Not Defined Text (Set Text=^")
SetLocal EnableDelayedExpansion
Set /P "LF=" <` &Set "LF=!LF:~0,1!"
For %%# in ("!LF!") Do For %%_ In (
\ / :) Do Set "Text=!Text:%%_=%%~#%%_%%~#!"
For /F delims^=^ eol^= %%# in ("!Text!") Do (
If #==#! EndLocal
If \==%%# (Findstr /A:%~1 . \` Nul
Type `.3) Else If /==%%# (Findstr /A:%~1 . /.\` Nul
Type `.5) Else (Echo %%#\..\`>`.dat
Findstr /F:`.dat /A:%~1 .
Type `.7))
If "\n"=="%~3" (Shift
Echo()
Shift
Shift
If ""=="%~1" Goto :Eof
Goto :__Color