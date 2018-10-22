rem ========== PreStart ==========
@echo off
chcp 65001

rem Set version info
set V=3.5.2

rem ========== Start ==========

cls
echo ###############################################################################
echo.
echo   ETHminerBuildScriptDmW Version %V%
echo.
echo   AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)
echo                           (https://github.com/DeadManWalkingTO)
echo.
echo ###############################################################################
echo.
echo ETHminerBuildScriptDmW
echo 1. Auto Remove old Ethminer's Directory
echo 2. Auto Clone (Download) latest Master of Ethminer
echo 3. Auto Configure Ethminer
echo 4. Auto Build Ethminer
echo.
pause
echo.
echo.

rem ========== Initializing ==========

setlocal
set DmW_Project_Name_V=Ethminer
set DmW_Project_Name=ethminer
set DmW_Project_Git=https://github.com/ethereum-mining/ethminer.git
set DmW_Project_VS=2017

rem Call Microsoft Visual C++ Build Tools
echo ==================================================
echo Call Microsoft Visual C++ Build Tools
echo.
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\Tools\VsDevCmd.bat"
if ERRORLEVEL 0 (goto :BT_OK) ELSE goto :BT_2015
:BT_2015
call "C:\Program Files (x86)\Microsoft Visual C++ Build Tools\vcbuildtools_msbuild.bat"
if not %ERRORLEVEL%==0 echo. & echo Fail & pause & goto :eof
set DmW_Project_VS=2015
:BT_OK
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Back to Directory
echo ==================================================
echo Back to Directory
echo.
cd "%~dp0\"
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem ========== Run ==========

rem Remove old Project's Directory
echo ==================================================
echo Remove old %DmW_Project_Name_V%'s Directory
echo.
rmdir /S /Q %DmW_Project_Name%
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Download Project
echo ==================================================
echo Download %DmW_Project_Name_V%
echo.
git clone --depth=1 --branch=master %DmW_Project_Git%
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Change Directory to Project's
echo ==================================================
echo Change Directory to %DmW_Project_Name_V%'s
echo.
cd %DmW_Project_Name%
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Git Fetch
echo ==================================================
echo Git Fetch
echo.
git fetch -q origin
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Git Checkout
echo ==================================================
echo Git Checkout
echo.
git checkout -qf FETCH_HEAD
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Git Submodule
echo ==================================================
echo Git Submodule
echo.
git submodule update --init --recursive
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Make Build Directory
echo ==================================================
echo Make Build Directory
echo.
if not exist build mkdir build
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Change Directory to Build
echo ==================================================
echo Change Directory to Build
echo.
cd build
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Configure Project
echo ==================================================
echo Configure %DmW_Project_Name_V%
echo.

:1000
set /A Pline=1000

set DmW_MSG=Enable CUDA mining.
echo %DmW_MSG%
set /p Dmw_Select="Enable? y/n: "
if '%Dmw_Select%' == 'y' set /A Pline=%Pline%+1
if '%Dmw_Select%' == 'n' set /A Pline=%Pline%+2
goto %Pline%
:1001
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DETHASHCUDA=ON
set /A Pline=%Pline%+9
goto %Pline%
:1002
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DETHASHCUDA=OFF
set /A Pline=%Pline%+8
goto %Pline%


:1010
set DmW_MSG=Enable OpenCL mining.
echo %DmW_MSG%
set /p Dmw_Select="Enable? y/n: "
if '%Dmw_Select%' == 'y' set /A Pline=%Pline%+1
if '%Dmw_Select%' == 'n' set /A Pline=%Pline%+2
goto %Pline%
:1011
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DETHASHCL=ON
set /A Pline=%Pline%+9
goto %Pline%
:1012
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DETHASHCL=OFF
rem Skip Install AMD binary kernels
set /A Pline=%Pline%+10
goto %Pline%

:1020
set DmW_MSG=Install AMD binary kernels.
echo %DmW_MSG%
set /p Dmw_Select="Install? y/n: "
if '%Dmw_Select%' == 'y' set /A Pline=%Pline%+1
if '%Dmw_Select%' == 'n' set /A Pline=%Pline%+2
goto %Pline%
:1021
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DBINKERN=ON 
set /A Pline=%Pline%+9
goto %Pline%
:1022
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DBINKERN=OFF 
set /A Pline=%Pline%+8
goto %Pline%

:1030
set DmW_MSG=Enable D-Bus support, OFF by default.
echo %DmW_MSG%
set /p Dmw_Select="Enable? y/n: "
if '%Dmw_Select%' == 'y' set /A Pline=%Pline%+1
if '%Dmw_Select%' == 'n' set /A Pline=%Pline%+2
goto %Pline%
:1031
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DETHDBUS=ON
set /A Pline=%Pline%+9
goto %Pline%
:1032
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DETHDBUS=OFF
set /A Pline=%Pline%+8
goto %Pline%

:1040
set DmW_MSG=Enable API Server.
echo %DmW_MSG%
set /p Dmw_Select="Enable? y/n: "
if '%Dmw_Select%' == 'y' set /A Pline=%Pline%+1
if '%Dmw_Select%' == 'n' set /A Pline=%Pline%+2
goto %Pline%
:1041
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DAPICORE=ON
set /A Pline=%Pline%+9
goto %Pline%
:1042
set DmW_CMAKE_CONFIG=%DmW_CMAKE_CONFIG% -DAPICORE=OFF
set /A Pline=%Pline%+8
goto %Pline%

:1050
echo.
if '%DmW_Project_VS%'=='2017' (echo VS2017 & set DmW_Project_VS_C="Visual Studio 15 2017 Win64") else (echo.)
if '%DmW_Project_VS%'=='2015' (echo VS2015 & set DmW_Project_VS_C="Visual Studio 14 2015 Win64" -T v140,host=x64) else (echo.)
set DmW_CMAKE_CONFIG=%DmW_Project_VS_C% %DmW_CMAKE_CONFIG%
set /A Pline=%Pline%+10
goto %Pline%

:1060
cmake .. -G %DmW_CMAKE_CONFIG%
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Build Project
echo ==================================================
echo Build %DmW_Project_Name_V%
echo.
cmake --build . --config Release
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Copy Project to Home Directory
echo ==================================================
echo Copy %DmW_Project_Name_V% to Home Directory
echo.
copy "%~dp0\%DmW_Project_Name%\build\ethminer\Release\ethminer.exe" "%~dp0\ethminer.exe"
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem Back to Directory
echo ==================================================
echo Change Directory to Home
echo.
cd "%~dp0\"
if %ERRORLEVEL%==0 (echo. & echo Done) else (echo. & echo Fail & pause & goto :eof) 
echo ==================================================
echo.
timeout 1 > nul

rem ETHminerBuildScriptDmW was completed
echo ==================================================
echo ETHminerBuildScriptDmW was completed successfully.
echo ==================================================
goto :EndProgram

rem ========== End ==========

endlocal
pause
echo.

rem ========== EoF ==========
