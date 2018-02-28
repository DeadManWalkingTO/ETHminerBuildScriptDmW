#========== PreStart ==========

#Set version info
V=1.2.5

#========== Start ==========

clear
echo '###############################################################################'
echo '#                                                                             #'
echo '#  ETHminerBuildScriptDmW Version '$V'                                       #'
echo '#                                                                             #'
echo '#  AUTHOR: DeadManWalking  (DeadManWalkingTO-GitHub)                          #'
echo '#                                                                             #'
echo '###############################################################################'
echo #
echo 'ETHminerBuildScriptDmW'
echo "1. Auto Remove old Ethminer's Directory"
echo "2. Auto Clone (Download) latest Master of Ethminer"
echo "3. Auto Configure Ethminer"
echo "4. Auto Build Ethminer"
echo #
read -n1 -r -p "Press any key to continue..." key
echo #
echo #

#========== Initializing ==========

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
cd ~/
echo "Done"
echo "=================================================="
echo #
sleep 1

#========== Run ==========

#Remove old Ethminer's Directory
echo "=================================================="
echo "Remove old Ethminer's Directory"
rm -rf ethminer
echo "Done"
echo "=================================================="
echo #
sleep 1

#Download Ethminer
echo "=================================================="
echo "Download Ethminer"
git clone https://github.com/ethereum-mining/ethminer.git
echo "Done"
echo "=================================================="
echo #
sleep 1

#Change Directory to Ethminer's
echo "=================================================="
echo "Change Directory to Ethminer's"
cd ethminer/
echo "Done"
echo "=================================================="
echo #
sleep 1

#Make Build Directory
echo "=================================================="
echo "Make Build Directory"
mkdir build
echo "Done"
echo "=================================================="
echo #
sleep 1

#Change Directory to Build
echo "=================================================="
echo "Change Directory to Build"
cd build/
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
cmake .. -G "Visual Studio 14 2015 Win64" -T v140,host=x64 -DETHASHCUDA=ON -DETHASHCL=OFF -DETHSTRATUM=ON -DAPICORE=OFF
echo "Done"
echo "=================================================="
echo #
sleep 1

#Build Ethminer
echo "=================================================="
echo "Build Ethminer"
cmake --build . --config Release
echo "Done"
echo "=================================================="
echo #
sleep 1

#Copy ethminer.exe to Home Directory
echo "=================================================="
echo "Copy ethminer.exe to Home Directory"
cp ./ethminer/Release/*.exe ~/
echo "Done"
echo "=================================================="
echo #
sleep 1

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
cd ~/
echo "Done"
echo "=================================================="
echo #
sleep 1

#ETHminerBuildScriptDmW was completed
echo "=================================================="
echo "ETHminerBuildScriptDmW was completed"
echo "=================================================="

#========== End ==========

read -n1 -r -p "Press any key to continue..." key
echo #

#========== EoF ==========
