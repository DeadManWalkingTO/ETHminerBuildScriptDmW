#========== PreStart ==========

#Set version info
V=2.2.7

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
sleep 1

#Install Required Packages
echo "=================================================="
echo "Install Required Packages (Install them if you have not installed them before.)"
read -p "Install Required Packages? (For Yes type Y or y. Anything else for No.) " -n 1 -r
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
sleep 1

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
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
git clone --depth=1 --branch=master https://github.com/ethereum-mining/ethminer.git
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

#Change Directory to Ethminer's
echo "=================================================="
echo "Change Directory to Ethminer's"
echo #
cd ethminer/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

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
sleep 1

#Make Build Directory
echo "=================================================="
echo "Make Build Directory"
echo #
mkdir build
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

#Change Directory to Build
echo "=================================================="
echo "Change Directory to Build"
echo #
cd build/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

#Configure Ethminer
echo "=================================================="
echo "Configure Ethminer"
echo "CUDA build -- DETHASHCUDA=ON"
echo "OpenCL build -- DETHASHCL=ON"
echo "Stratum build -- DETHSTRATUM=ON"
echo "API build -- DAPICORE=ON"
echo #
cmake .. -G "Visual Studio 14 2015 Win64" -T v140,host=x64 -DETHASHCUDA=ON -DETHASHCL=OFF -DETHSTRATUM=ON -DAPICORE=OFF
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

#Build Ethminer
echo "=================================================="
echo "Build Ethminer"
echo #
cmake --build . --config Release
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

#Copy ethminer.exe to Home Directory
echo "=================================================="
echo "Copy ethminer.exe to Home Directory"
echo #
cp ./ethminer/Release/*.exe ~/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~/
if [ $? -eq 0 ]; then echo; echo "Done"; else echo; echo "Fail"; exit; fi
echo "=================================================="
echo #
sleep 1

#ETHminerBuildScriptDmW was completed
echo "=================================================="
echo "ETHminerBuildScriptDmW was completed"
echo "=================================================="

#========== End ==========

read -n1 -r -p "Press any key to continue... " key
echo #

#========== EoF ==========
