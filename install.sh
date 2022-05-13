# Create folders MC and FRP
mkdir mc
mkdir frp

# Check wget
echo "[INFO]check wget..."
wget --version > /dev/null
# If wget is not available, install wget
if [ $? -ne 0 ]; then
    echo "[ERROR]wget is not installed!"
    echo "[INFO]installing wget..."
    apt update
    apt install wget
    echo "[INFO]install wget success!"
fi
echo "[INFO]wget is installed!"

# Install frp
echo "[INFO]installing frp..."
# Choose frp server
echo "[INFO]choose frp server:"
echo "0. None"
echo "1. Sakura Frp"
read -p "input number: " frpServer
if [ $frpServer -eq 0 ]; then
    echo "[INFO]no frp server"
elif [ $frpServer -eq 1 ]; then
    cd frp
    echo "[INFO]installing sakura frp..."
    wget https://getfrp.sh/d/frpc_linux_amd64
    chmod +x frpc_linux_amd64
    cd ..
fi
echo "[INFO]install frp success!"

# Agree Minecraft eula
rm -rf mc/eula.txt
echo "[INFO]do you agree minecraft eula?(y/n)"
echo "[INFO]https://account.mojang.com/documents/minecraft_eula"
read -p "input: " agreeMinecraftServerEula
if [ $agreeMinecraftServerEula = "y" ]; then
    echo "eula=true" >> mc/eula.txt
elif [ $agreeMinecraftServerEula = "n" ]; then
    echo "eula=false" >> mc/eula.txt
fi
# Install Minecraft server
cd mc
echo "[INFO]installing Minecraft server..."
echo "[INFO]input server.jar link"
read -p "input: " serverJarLink
wget $serverJarLink
cd ..
echo "[INFO]install Minecraft server success!"
