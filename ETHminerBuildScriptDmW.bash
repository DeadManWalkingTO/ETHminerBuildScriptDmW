#!/bin/bash
#========== PreStart ==========

#Set version info
V=1.3.1

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
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#========== Run ==========

#Remove old Ethminer's Directory
echo "=================================================="
echo "Remove old Ethminer's Directory"
echo #
rm -rf ethminer
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Download Ethminer
echo "=================================================="
echo "Download Ethminer"
echo #
git clone https://github.com/ethereum-mining/ethminer.git
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Change Directory to Ethminer's
echo "=================================================="
echo "Change Directory to Ethminer's"
echo #
cd ethminer
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Git Submodules
echo "=================================================="
echo "Git Submodules"
echo #
git submodule update --init --recursive
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Make Build Directory
echo "=================================================="
echo "Make Build Directory"
echo #
mkdir build
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Change Directory to Build
echo "=================================================="
echo "Change Directory to Build"
echo #
cd build
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Configure Ethminer
echo "=================================================="
echo "Configure Ethminer"
echo "CUDA build ON -- DETHASHCUDA=ON"
echo "OpenCL build ON -- DETHASHCL=ON"
echo "Stratum build ON -- DETHSTRATUM=ON"
echo "API build ON -- DAPICORE=ON"
echo #
cmake .. -DETHASHCUDA=ON -DETHASHCL=OFF -DETHSTRATUM=ON -DAPICORE=OFF
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Build Ethminer
echo "=================================================="
echo "Build Ethminer"
echo #
cmake --build .
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Copy ethminer to Home Directory
echo "=================================================="
echo "Copy ethminer to Home Directory"
echo #
cp ./ethminer/Release/ethminer ~
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#ETHminerBuildScriptDmW was completed
echo "=================================================="
echo "ETHminerBuildScriptDmW was completed"
echo "=================================================="
echo #

#========== End ==========

read -n1 -r -p "Press any key to continue... " key
echo #
exit 0

#========== EoF ==========
