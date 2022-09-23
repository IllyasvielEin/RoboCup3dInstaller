#!/bin/bash

colorlog () {
    echo -e "\e[$2m$1 \e[0m"
}

release_name="$(lsb_release -r --short)"

release_name_short="${release_name:0:2}"

colorlog "Your Ubuntu Edition is ${release_name}, Main installer start" 32

sudo apt upgrade

sudo apt install curl -y

if [ ${release_name_short} == 22 ];then

    colorlog "ubuntu${release_name} hasn't surpport." 31

    exit 1

    sudo apt-get install g++ git make cmake libfreetype6-dev libode-dev libsdl1.2-dev ruby ruby-dev libdevil-dev libboost-dev libboost-thread-dev libboost-regex-dev libboost-system-dev qtbase5-dev qtchooser qt5-qmake -y

    git clone https://gitlab.com/robocup-sim/SimSpark.git

    cd SimSpark || exit 27
        bash ./clean.sh
        bash ./build.sh
    cd ..

elif [ ${release_name_short} == 20 ];then
    echo "Add openSUSE source"
    echo 'deb http://download.opensuse.org/repositories/science:/SimSpark/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/science:SimSpark.list
    curl -fsSL https://download.opensuse.org/repositories/science:SimSpark/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/science_SimSpark.gpg > /dev/null
    sudo apt update
    sudo apt install rcssserver3d -y || (colorlog "Installation fail" && exit 1)
    colorlog "Installation success,\nIf a new version of simspark & rcssserver3d has been released, you can upgrade them by:\n\nsudo apt-get update && sudo apt-get install rcssserver3d" 32
elif [ ${release_name_short} == 18 ];then
    echo "Add openSUSE source"
    echo 'deb http://download.opensuse.org/repositories/science:/SimSpark/xUbuntu_18.04/ /' | sudo tee /etc/apt/sources.list.d/science:SimSpark.list
    curl -fsSL https://download.opensuse.org/repositories/science:SimSpark/xUbuntu_18.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/science_SimSpark.gpg > /dev/null
    sudo apt update
    sudo apt install rcssserver3d -y || (colorlog "Installation fail" && exit 1)
    colorlog "Installation success,\nIf a new version of simspark & rcssserver3d has been released, you can upgrade them by:\n\nsudo apt-get update && sudo apt-get install rcssserver3d" 32
else
    colorlog "Unknow or unsupporting release, please make sure your Ubuntu is in {18.04 ~ 22}" 31
fi

colorlog "Installation Done" 32
