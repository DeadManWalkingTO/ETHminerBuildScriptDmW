#========== PreStart ==========

#Set version info
V=2.1.4

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
echo "1. Install Build Tools"
echo "2. Build OpenSSL"
echo "3. Auto Remove old Ethminer's Directory"
echo "4. Auto Clone (Download) latest Master of Ethminer"
echo "5. Auto Configure Ethminer"
echo "6. Auto Build Ethminer"
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
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Install Build Tools
echo "=================================================="
echo "Install Build Tools (Install them if you have not installed them before.)"
read -p "Install Build Tools? (For Yes type Y or y. Anything else for No.) " -n 1 -r
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
pacman -S make git subversion cmake
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


#Build OpenSSL
echo "=================================================="
echo "Build OpenSSL (Build to fix the Ethminer's issue #817 - If you get OpenSSL build error with hunter.)"
read -p "Build latest master OpenSSL? (For Yes type Y or y. Anything else for No.) " -n 1 -r
echo #
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo #
echo "--------------------------------------------------"
echo "Remove OpenSSL Directory"
echo #
rm -rf openssl
echo #
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
echo "--------------------------------------------------"
echo "Clone OpenSSL"
echo #
git clone git://github.com/openssl/openssl.git
echo #
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
echo "--------------------------------------------------"
echo "Change Directory to OpenSSL"
echo #
cd openssl
echo #
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
# "Ensure that line endings are set correctly"
echo "--------------------------------------------------"
echo "Ensure that line endings are set correctly"
git config core.autocrlf false
git config core.eol lf
git checkout .
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
# "Checkout the latest tag"
echo "--------------------------------------------------"
echo "Checkout the latest tag"
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
echo "--------------------------------------------------"
echo "Config"
echo #
./config
echo #
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
echo "--------------------------------------------------"
echo "Make"
echo #
make
echo #
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
echo "--------------------------------------------------"
echo "Make Test"
echo #
make test
echo #
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
echo "--------------------------------------------------"
echo "Make Install"
echo #
make install
echo #
echo "Done"
echo "--------------------------------------------------"
echo #
sleep 1
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
cd ethminer/
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
cd build/
echo "Done"
echo #
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
cmake .. -G "Visual Studio 14 2015 Win64" -T v140,host=x64 -DETHASHCUDA=ON -DETHASHCL=OFF -DETHSTRATUM=ON -DAPICORE=OFF
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Build Ethminer
echo "=================================================="
echo "Build Ethminer"
echo #
cmake --build . --config Release
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Copy ethminer.exe to Home Directory
echo "=================================================="
echo "Copy ethminer.exe to Home Directory"
echo #
cp ./ethminer/Release/*.exe ~/
echo #
echo "Done"
echo "=================================================="
echo #
sleep 1

#Change Directory to Home
echo "=================================================="
echo "Change Directory to Home"
echo #
cd ~/
echo #
echo "Done"
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
