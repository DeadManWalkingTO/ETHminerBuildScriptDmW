#========== PreStart ==========

#Set version info
V=2.3.3

#========== Start ==========

clear
echo '###############################################################################'
echo #
echo "  ETHminerBuildScriptDmW Version '$V'"
echo #
echo "  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)"
echo #
echo '###############################################################################'
echo #
echo 'ETHminerBuildScriptDmW'
echo "1. Auto Install required packages (MinGW)"
echo "2. Auto Remove old Ethminer's Directory"
echo "3. Auto Clone (Download) latest Master of Ethminer"
echo "4. Auto Configure Ethminer"
echo "5. Auto Build Ethminer"
echo #
read -n1 -r -p "Press any key to continue... " key
echo #
echo #

#========== Initializing ==========

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Install Required Packages
echo "=================================================="
echo "Install Required Packages"
read -p "Continue? (For Yes type Y or y. Anything else for No.) " -n 1 -r
echo # 
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo #
pacman -S git
echo #
pacman -S cmake
echo #
pacman -S subversion
echo #
pacman -S make
echo #
pacman -S mingw-w64-x86_64-gcc 
echo #
pacman -S mingw-w64-x86_64-cmake 
echo #
pacman -S mingw-w64-x86_64-pkg-config
echo #
pacman -S base-devel
echo #
fi
echo "Done"
echo "=================================================="
echo #
sleep 1s

#Fix Git Dashless Error
echo "=================================================="
echo "Change Directory to Home"
echo #
echo "1/2"
echo '#!/bin/sh' > /mingw64/bin/git
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "2/2"
echo 'PATH=/bin git "$@"' >> /mingw64/bin/git
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#========== Run ==========

#Remove old Ethminer's Directory
echo "=================================================="
echo "Remove old Ethminer's Directory"
echo #
rm -rf ethminer
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Download Ethminer
echo "=================================================="
echo "Download Ethminer"
echo #
git clone --depth=1 --branch=master https://github.com/ethereum-mining/ethminer.git
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Change Directory to Ethminer's
echo "=================================================="
echo "Change Directory to Ethminer's"
echo #
cd ethminer/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Git Fetch
echo "=================================================="
echo "Git Fetch"
git fetch -q origin
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Git Checkout
echo "=================================================="
echo "Git Checkout"
git checkout -qf FETCH_HEAD
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Git Submodules
echo "=================================================="
echo "Git Submodules"
echo #
git submodule update --init --recursive
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Make Build Directory
echo "=================================================="
echo "Make Build Directory"
echo #
mkdir build
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Change Directory to Build
echo "=================================================="
echo "Change Directory to Build"
echo #
cd build/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Configure Ethminer
echo "=================================================="
echo "Configure Ethminer"
echo "CUDA build -- DETHASHCUDA=ON"
echo "OpenCL build -- DETHASHCL=ON"
echo "Stratum build -- DETHSTRATUM=ON"
echo "API build -- DAPICORE=ON"
echo #
cmake .. -G "Visual Studio 14 2015 Win64" -T v140,host=x64 -DETHASHCUDA=ON -DETHASHCL=ON -DETHSTRATUM=ON -DAPICORE=ON
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Build Ethminer
echo "=================================================="
echo "Build Ethminer"
echo #
cmake --build . --config Release
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Copy ethminer.exe to Home Directory
echo "=================================================="
echo "Copy ethminer.exe to Home Directory"
echo #
cp ./ethminer/Release/*.exe ~/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#ETHminerBuildScriptDmW was completed
echo "=================================================="
echo "ETHminerBuildScriptDmW was completed"
echo "=================================================="

#========== End ==========

read -n1 -r -p "Press any key to continue... " key
echo #

#========== EoF ==========
