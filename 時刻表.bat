@echo off
cd C:\�����\
set time_temp=%time: =0%
set hh_temp=%time_temp:~0,2%
set mm_temp=%time_temp:~3,2%

set /a now_time=60*(1%hh_temp%-100)+(1%mm_temp%-100)
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

SET /P selected="�V���b�g�_�E�����܂����H(Y=YES / N=NO)�H"

if /i {%selected%}=={y} (goto :yes)

if /i {%selected%}=={yes} (goto :yes)



:no
echo "No ���I������܂���"
exit /b

:yes
REM �I�����ɑ���bat�𑖂点��ꍇ�͂����ɏ�����REM������
REM call C:\�c�Ǝ���\finishilog.bat

REM �V���b�g�_�E������

shutdown.exe /s /t 0

:sub
set hh_temp=%time_temp:~0,2%
set mm_temp=%time_temp:~3,2%
