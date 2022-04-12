@echo off
cd C:\時刻表
set time_temp=%time: =0%
set hh_temp=%time_temp:~0,2%
set mm_temp=%time_temp:~3,2%

set /a now_time=60*(1%hh_temp%-100)+(1%mm_temp%-100)
set /a arrive_time=%now_time%+15

echo 現在時刻は%hh_temp%:%mm_temp%です。
echo 乗車候補は

set flg=0

setlocal enabledelayedexpansion

for /f %%X in (時刻表.txt) do (

set time_temp=%%X
call :sub

set /a plan_time=60*!hh_temp!+!mm_temp!
set /a walk_time=!plan_time!-%now_time%

if !flg! equ 1 (

echo %%X発　!walk_time!分後です


goto END
) 


if 15 lss !walk_time! (
echo !c!発　!d!分後です
echo %%X発　!walk_time!分後です
set flg=1
) 

set c=%%X
set d=!walk_time!
) 
:END

SET /P selected="シャットダウンしますか？(Y=YES / N=NO)？"

if /i {%selected%}=={y} (goto :yes)

if /i {%selected%}=={yes} (goto :yes)



:no
echo "No が選択されました"
exit /b

:yes
REM 終了時に他のbatを走らせる場合はここに書いてREMを消す
REM call C:\残業時間\finishilog.bat

REM シャットダウンする

shutdown.exe /s /t 0

:sub
set hh_temp=%time_temp:~0,2%
set mm_temp=%time_temp:~3,2%
