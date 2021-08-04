Customization for debian or ubuntu server. Priority versions for Debian 10.+ and Ubuntu 20.+
============================================================================================

1. #### [Network](#customization-the-network)
    * [Network device](#first-lets-find-out-the-parameters-and-network-device-on-our-server)
    * [Edit parameters](#lets-start-customization-open-the-file-for-editing)

2. #### [Dependencies](#installing-dependencies)
    * [Apt update upgrade](#first-lets-update-the-apt-packages-and-then-the-system)
    * [Install packages](#lets-download-the-main-packages-for-python-development-and-for-further-customization)
    * [Use oh-my-zsh](#install-and-use-oh-my-zsh)

3. #### [Users](#working-with-users)
    * [Create users](#create-users-with-different-rights)

4. #### [SSH](#working-and-use-ssh)
    * [Add to startup](#add-openssh-server-to-startup)
    * [Check functionality](#checking-functionality-of-the-utility)
    * [Customization ssh](#customization-ssh-config)


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

#### Let's download the main packages for python development and for further customization

> Скачиваем основные пакеты для разработки на python и для дальнейшей настройки

```bash
sudo apt install -y openssh-server vim zsh mosh nginx htop git curl wget unzip zip make python3-dev python3-lxml supervisor python3 build-essential libssl-dev libffi-dev python3-pip python3-venv tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
```

***

#### Install and use oh-my-zsh

> Установка и использование конфига oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

```bash
zsh
```

&nbsp;

Working with users
------------------

#### Create users with different rights

> Создание пользователей с разными правами

Create standard user without rights

> Создание обычного пользователя без прав

```bash
sudo useradd -m -G sudo,wheel -s /bin/bash -p <password> <username>
```

Create user with group and rights root

> Создание пользователя с группой и правами root

```bash
sudo useradd -m -o -u 0 -g 0 -s /bin/bash -p <password> <username>
```

To see the settings of the rights of groups and users

> Посмотреть настройки прав групп и пользователей

```bash
sudo nano /etc/sudoers
```

&nbsp;

Working and use SSH
-------------------

#### Add openssh-server to startup 

> Добавим openssh-server в автозагрузку

```bash
sudo systemctl enable ssh
```

#### Checking functionality of the utility

> Проверяем работоспособность утилиты

```bash
ssh localhost
```

#### Customization ssh config

> Настрока ssh конфига

Copying the default config

> Копирование стандартного конфига

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.default
```

Let's start editing

> Начинаем редактирование

```bash
sudo nano /etc/ssh/sshd_config
```
