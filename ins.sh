#!/bin/bash

colorlog () {
    echo -e "\e[$2m$1 \e[0m"
}

colorlog "Robocup 3D simulation Env installation script start" 32
sleep 1

echo "checking Linux edition"
linux_uname="$(uname -a)"
if [[ ! ${linux_uname} =~ "Ubuntu" ]];then
    colorlog "The Installation only for Ubuntu18~22,
Please search for information on https://gitlab.com/robocup-sim/SimSpark/-/wikis/Installation-on-Linux" 31
    exit 1
fi
echo "Linux edition OK"

echo "Checking source now..."
sourcehelp="To make sure installation successfully, please replace your source list.
You can get help from https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/"
key_str=$(cat /etc/apt/sources.list | grep "mirror")
if [[ "${key_str}" == "" ]];then
    colorlog "${sourcehelp}" 31
    exit 2
fi
echo "Source OK"

# exit 1

echo "start update"
sudo apt update

echo "install git"
sudo apt install git -y

# echo "make directory in ~/.local/RoboCup3d"
# mkdir ~/.local/Robocup3d -p

cd ~/.local/ || (mkdir ~/.local && cd ~/.local)

if [[ -d RoboCup3dInstaller ]];then
    colorlog "Repo existed in ~/.local, please change name or remove it." 31
fi

echo "Cloning main Installer in ~/.local/RoboCup3dInstaller"
git clone https://gitee.com/IllyasvielEin/RoboCup3dInstaller.git

cd RoboCup3dInstaller || exit

sleep 1

bash ./setup.sh 

echo "Robocup 3D simulation Env installation script END"
