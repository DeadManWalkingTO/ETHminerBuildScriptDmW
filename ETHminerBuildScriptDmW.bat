rem ========== PreStart ==========
@echo off

rem Set version info
set V=1.4.2

rem ========== Start ==========

cls
echo '###############################################################################'
echo.
echo "  ETHminerBuildScriptDmW Version '$V'"
echo.
echo "  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)"
echo.
echo '###############################################################################'
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

rem Call Microsoft Visual C++ Build Tools
echo ==================================================
echo Call Microsoft Visual C++ Build Tools
echo.
call "C:\Program Files (x86)\Microsoft Visual C++ Build Tools\vcbuildtools_msbuild.bat"
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
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem ========== Run ==========

rem Remove old Ethminer's Directory
echo ==================================================
echo Remove old Ethminer's Directory
echo.
rmdir /S /Q ethminer
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Download Ethminer
echo ==================================================
echo Download Ethminer
echo.
git clone https://github.com/ethereum-mining/ethminer.git
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Change Directory to Ethminer's
echo ==================================================
echo Change Directory to Ethminer's
echo.
cd ethminer
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Git Submodule
echo ==================================================
echo Git Submodule
echo.
git submodule update --init --recursive
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Make Build Directory
echo ==================================================
echo Make Build Directory
echo.
mkdir build
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Change Directory to Build
echo ==================================================
echo Change Directory to Build
echo.
cd build
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Configure Ethminer
echo ==================================================
echo Configure Ethminer
echo CUDA build ON -- DETHASHCUDA=ON
echo OpenCL build ON -- DETHASHCL=ON
echo Stratum build ON -- DETHSTRATUM=ON
echo API build ON -- DAPICORE=ON
echo.
cmake .. -G "Visual Studio 14 2015 Win64" -T v140,host=x64 -DETHASHCL=ON -DETHASHCUDA=ON -DETHSTRATUM=ON -DAPICORE=ON
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Build Ethminer
echo ==================================================
echo Build Ethminer
echo.
cmake --build . --config Release
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Copy ethminer to Home Directory
echo ==================================================
echo Copy ethminer to Home Directory
echo.
copy "%~dp0\ethminer\Release\ethminer.exe" "%~dp0\ethminer.exe"
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem Back to Directory
echo ==================================================
echo Change Directory to Home
echo.
cd "%~dp0\"
echo.
echo Done
echo ==================================================
echo.
timeout 1 > nul

rem ETHminerBuildScriptDmW was completed
echo ==================================================
echo ETHminerBuildScriptDmW was completed
echo ==================================================

rem ========== End ==========

endlocal
pause
echo.

rem ========== EoF ==========
