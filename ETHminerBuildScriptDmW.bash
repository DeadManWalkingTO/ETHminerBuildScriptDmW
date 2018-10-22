#!/bin/bash
#========== PreStart ==========

#Set version info
V=3.5.2

#========== Start ==========

clear
echo '###############################################################################'
echo #
echo "  ETHminerBuildScriptDmW Version '$V'"
echo #
echo "  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)"
echo "                          (https://github.com/DeadManWalkingTO)"
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
DmW_Project_Name_V=Ethminer
DmW_Project_Name=ethminer
DmW_Project_Git=https://github.com/ethereum-mining/ethminer.git

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

#Remove old Project's Directory
echo "=================================================="
echo 'Remove old '$DmW_Project_Name_V"'s Directory"
echo #
rm -rf $DmW_Project_Name
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Download Project
echo "=================================================="
echo 'Download '$DmW_Project_Name_V
echo #
git clone --depth=1 --branch=master $DmW_Project_Git
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Change Directory to Project's
echo "=================================================="
echo 'Change Directory to '$DmW_Project_Name_V"'s"
echo #
cd $DmW_Project_Name
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
mkdir -p build
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

#Configure Project
echo "=================================================="
echo 'Configure' $DmW_Project_Name_V
echo #

DmW_MSG="Enable CUDA mining."
echo $DmW_MSG
read -p "Enable? (For Yes type Y or y. Anything else for No.) " -n 1 -r
echo # 
if [[ $REPLY =~ ^[Yy]$ ]]
then
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DETHASHCUDA=ON'
else
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DETHASHCUDA=OFF'
fi

DmW_MSG="Enable OpenCL mining."
echo $DmW_MSG
read -p "Enable? (For Yes type Y or y. Anything else for No.) " -n 1 -r
echo # 
if [[ $REPLY =~ ^[Yy]$ ]]
then
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DETHASHCL=ON'
DmWCL=1
else
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DETHASHCL=OFF'
DmWCL=0
fi

if [ "$DmWCL" == "1" ]
then
DmW_MSG="Install AMD binary kernels."
echo $DmW_MSG
read -p "Install? (For Yes type Y or y. Anything else for No.) " -n 1 -r
echo # 
if [[ $REPLY =~ ^[Yy]$ ]]
then
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DBINKERN=ON'
else
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DBINKERN=OFF'
fi
fi

DmW_MSG="Enable D-Bus support, OFF by default."
echo $DmW_MSG
read -p "Enable? (For Yes type Y or y. Anything else for No.) " -n 1 -r
echo # 
if [[ $REPLY =~ ^[Yy]$ ]]
then
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DETHDBUS=ON'
else
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DETHDBUS=OFF'
fi

DmW_MSG="Enable API Server."
echo $DmW_MSG
read -p "Enable? (For Yes type Y or y. Anything else for No.) " -n 1 -r
echo # 
if [[ $REPLY =~ ^[Yy]$ ]]
then
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DETHDBUS=ON'
else
DmW_CMAKE_CONFIG=$DmW_CMAKE_CONFIG' -DETHDBUS=OFF'
fi

echo #
cmake .. $DmW_CMAKE_CONFIG
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Build Project
echo "=================================================="
echo 'Build '$DmW_Project_Name_V
echo #
cmake --build .
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1s

#Copy Project to Home Directory
echo "=================================================="
echo 'Copy '$DmW_Project_Name_V' to Home Directory'
echo #
cp ~/$DmW_Project_Name/build/ethminer/Release/ethminer ~
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

#========== End ==========

read -n1 -r -p "Press any key to continue... " key
echo #
exit 0

#========== EoF ==========
