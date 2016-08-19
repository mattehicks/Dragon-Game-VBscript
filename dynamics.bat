@echo off

setlocal enabledelayedexpansion

set COUNT=0

for /F "tokens=*" %%n in (foo.txt) do (

  echo %%n
  set /A COUNT=!COUNT! + 1

)