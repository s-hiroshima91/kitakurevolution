@echo off
cd C:\�����\
set time_temp=%time: =0%
set hh_temp=%time_temp:~0,2%
set mm_temp=%time_temp:~3,2%

set /a now_time=60*%hh_temp%+%mm_temp%
set /a arrive_time=%now_time%+15

echo ���ݎ�����%hh_temp%:%mm_temp%�ł��B
echo ��Ԍ���

set flg=0

setlocal enabledelayedexpansion

for /f %%X in (�����\.txt) do (

set time_temp=%%X
call :sub

set /a plan_time=60*!hh_temp!+!mm_temp!
set /a walk_time=!plan_time!-%now_time%

if !flg! equ 1 (

echo %%X���@!walk_time!����ł�


goto END
) 


if 15 lss !walk_time! (
echo !c!���@!d!����ł�
echo %%X���@!walk_time!����ł�
set flg=1
) 

set c=%%X
set d=!walk_time!
) 
:END
pause

:sub
set hh_temp=%time_temp:~0,2%
set mm_temp=%time_temp:~3,2%
exit /b