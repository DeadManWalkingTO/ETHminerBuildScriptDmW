#!/bin/bash
#========== PreStart ==========

#Set version info
V=1.4.2

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
echo "1. Auto Remove old Ethminer's Directory"
echo "2. Auto Clone (Download) latest Master of Ethminer"
echo "3. Auto Configure Ethminer"
echo "4. Auto Build Ethminer"
echo #
read -n1 -r -p "Press any key to continue... " key
echo #
echo #

#========== Initializing ==========

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~
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
cd ethminer
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
sleep 1

#Git Checkout
echo "=================================================="
echo "Git Checkout"
git checkout -qf FETCH_HEAD
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

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
cd build
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
cmake .. -DETHASHCUDA=ON -DETHASHCL=ON -DETHSTRATUM=ON -DAPICORE=ON
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Build Ethminer
echo "=================================================="
echo "Build Ethminer"
echo #
cmake --build .
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Copy ethminer to Home Directory
echo "=================================================="
echo "Copy ethminer to Home Directory"
echo #
cp ./ethminer/Release/ethminer ~
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#ETHminerBuildScriptDmW was completed
echo "=================================================="
echo "ETHminerBuildScriptDmW was completed"
echo "=================================================="
echo #

#========== Error Handling ==========

#========== End ==========

read -n1 -r -p "Press any key to continue... " key
echo #
exit 0

#========== EoF ==========
