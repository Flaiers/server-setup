Customization for debian or ubuntu server. Priority versions for Debian 10.+ and Ubuntu 20.+
============================================================================================

1. #### [Network](#customization-the-network)
    * [Network device](#first-lets-find-out-the-parameters-and-network-device-on-our-server)
    * [Edit parameters](#lets-start-customization-open-the-file-for-editing)

2. #### [Dependencies](#installing-dependencies)
    * [Apt update upgrade](#first-lets-update-the-apt-packages-and-then-the-system)
    * [Install packages](#lets-download-the-main-packages-for-python-development-and-for-further-configuration)

Customization the Network
-------------------------

#### First, let's find out the parameters and network device on our server

> Для начала узнаем параметры и сетевое устройство на нашем сервере

```bash
sudo lshw -class network
```

#### From the response, you need a parameter `*-network` then the next parameter `logical name` write it down or remember it

> Из ответа нужен параметр `*-network` следующий параметр `logical name` запишите или запомните его

***

#### Let's start customization, open the file for editing

> Приступаем к настройке, открываем для редактирования файл

```bash
sudo nano /etc/network/interfaces
```

#### Write the code in this file with their parameters

> Записываем в файл данный код, со своими парметрами

```bash
iface lo inet loopback
auto lo

auto <logical name>
iface <logical name> inet static
    address <ip>
    netmask 255.255.255.0
    gateway <ip gateway>
    dns-nameservers 8.8.8.8
    metric 0
```

#### Reboot the server

> Перезагружаем сервер

```bash
sudo reboot
```

&nbsp;

Installing Dependencies
-----------------------

#### First, let's update the apt packages and then the system

> Для начала обновим apt пакеты и затем систему

```bash
sudo apt update
```

```bash
sudo apt upgrade
```

***

#### Let's download the main packages for python development and for further configuration

> Скачиваем основные пакеты для разработки на python и для дальнейшей настройки

```bash
sudo apt install -y openssh-server vim zsh mosh nginx htop git curl wget unzip zip make python3-dev python3-lxml supervisor python3 build-essential libssl-dev libffi-dev python3-pip python3-venv
```
