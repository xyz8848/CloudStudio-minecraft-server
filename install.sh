# Create folders MC and FRP
mkdir mc
mkdir frp

# Check whether wget is available
wget --version > /dev/null
# If wget is not available, install wget
if [ $? -ne 0 ]; then
    echo "[INFO]wget is not installed!"
    echo "[INFO]installing wget..."
    apt update
    apt install wget
    echo "[INFO]install wget success!"
fi
echo "[INFO]wget is installed!"

# Choose frp server
echo "[INFO]choose frp server:"
echo "0. None"
echo "1. Sakura Frp"
read -p "input number: " frpServer

if [ $frpServer -eq 0 ]; then
    echo "[INFO]no frp server"

# Install Sakura frp
elif [ $frpServer -eq 1 ]; then
    cd frp
    echo "[INFO]installing sakura frp..."
    wget https://getfrp.sh/d/frpc_linux_amd64
    chmod +x frpc_linux_amd64
    cd ..
fi

# Agree eula
echo "[INFO]do you agree minecraft eula?(y/n)"
echo "[INFO]eula link: https://account.mojang.com/documents/minecraft_eula"
read -p "input: " agreeMinecraftServerEula
if [ $agreeMinecraftServerEula = "y" ]; then
    echo "eula=true" >> mc/eula.txt
elif [ $agreeMinecraftServerEula = "n" ]; then
    echo "eula=false" >> mc/eula.txt
fi

# Choose Minecraft server
echo "[INFO]choose minecraft server"
echo "1.Vanilla"
echo "2.Spigot"
echo "3.Paper"
read -p "input number: " minecraftServer

# Install Vanilla
if [ $minecraftServer -eq 1 ]; then
    echo "[INFO]installing vanilla..."
    cd mc
    cd ..

# Install Spigot
elif [ $minecraftServer -eq 2 ]; then
    echo "[INFO]installing spigot..."
    cd mc
    wget https://cdn.getbukkit.org/spigot/spigot-1.8.8-R0.1-SNAPSHOT-latest.jar
    mv spigot-1.8.8-R0.1-SNAPSHOT-latest.jar server.jar
    cd ..

# Install Paper
elif [ $minecraftServer -eq 3 ]; then
    echo "[INFO]installing paper..."
    cd mc
    # wget https://papermc.io/api/v1/paper/1.15.2/latest/download
    wget https://papermc.io/api/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar
    mv paper-1.8.8-445.jar server.jar
    cd ..
fi
