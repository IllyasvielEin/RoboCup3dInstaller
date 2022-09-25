# RoboCup3D env install one-lined.

[TOC]

## 简介

One-Line install the RoboCup3D Environment.

Integrales from https://gitlab.com/robocup-sim/SimSpark/-/wikis/Installation-on-Linux.

Thanks for [D0ot](https://github.com/D0ot) and [EzraRT](https://github.com/EzraRT).

## 说明

使用前**务必阅读以下说明**：

1. 程序适用于Ubuntu18~20，22暂时不推荐使用。其他版本烦请自行检测。
2. **重要**：使用前最好更换好国内源，**RoboViz使用前安装好Nvidia显卡驱动**。A卡、集显核显未测试。
3. 安装前务必确保已经完成2的操作。接着参照[使用方法](#使用方法)进行安装。
4. 如遇安装失败，可以根据~目录下的robocup.log文件和setup.sh中的命令进行手动测试。

## 使用方法

commandline enter:

国内最好使用gitee：
```shell
wget -O- https://gitee.com/IllyasvielEin/RoboCup3dInstaller/raw/main/ins.sh | bash
```

or

```shell
wget -O- https://github.com/IllyasvielEin/RoboCup3dInstaller/raw/main/ins.sh | bash
```

指令：

```shell
rcssserver3d #打开服务器
```

可在~/.local/RoboCup3dInstaller下使用addition_install.sh进行额外功能，具体使用手册参照简介中的地址。

## 安装列表

程序会安装或附带以下软件：

1. SimSpark 0.3.3 （2022世界赛版本）
   - rcssserver3d 0.7.4
   - rsgedit \[可选]
   - simspark-utilities \[可选]
2. Roboviz 1.8.2

详见~/.local/RoboCup3d/RoboCup3dInstaller目录下文件夹。

## 安装解释

程序首先在~/.local目录下下载安装目录Robocup3dInstaller，随后启动setup.sh，根据不同版本选择最简方式进行安装。

## 卸载与升级

18,20版本使用openSUSE的源进行比较简洁的安装。

卸载：

```shell
sudo apt remove --purge rcssserver3d
```

升级：

```shell
sudo apt update && sudo apt install rcssserver3d 
```
