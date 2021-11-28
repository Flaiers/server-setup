All about setup Debian and Ubuntu server
========================================
### *Note: for Debian 10.+ and Ubuntu 20.+ versions*

1. ### [Users](#working-with-users)
    * [How to Create New Users](#create-users-with-different-rights)
    * [How to Delete Existing Users](#delete-users)

2. ### [Using SSH](#working-and-use-ssh)
    * [Adding to Startup](#add-openssh-server-to-startup)
    * [Checkup Utility Functionality](#checking-functionality-of-the-utility)
    * [Generating RSA Keys](#generate-and-upload-a-pair-of-rsa-keys-to-server)
    * [Setup SSH](#setup-ssh-config)
    * [Save and Restart](#save-file-etcsshsshd_config-and-restart-ssh)
    * [Connections of SSH](#config-ssh-connections)
    * [Load files](#load-files-by-ssh)

3. ### [Using VPN](#install-and-setup-openvpn)
    * [Installing](#download-shell-script-for-installation-openvpn)
    * [Adding to Startup](#start-and-add-to-startup)
    * [Connecting](#connecting-from-local-computer)

&nbsp;

Working with users
------------------
### Create users with different rights

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

***

### Delete users

> Удаление пользователей

Flags: -f (--force) for forced deletion, -r (--remove) for remove home directory

> Флаги: -f для принудительного удаления, -r для удаления домашней дериктории

```bash
userdel -f -r <username>
```

&nbsp;

Working and use SSH
-------------------
### Add openssh-server to startup 

> Добавим openssh-server в автозагрузку

```bash
sudo systemctl enable ssh
```

***

### Checking functionality of the utility

> Проверяем работоспособность утилиты

```bash
ssh localhost
```

***

### Generate and upload a pair of rsa keys to server

> Сгенерировать и загрузить на сервер пару rsa ключей

```bash
ssh-keygen -t rsa
```

```bash
ssh-copy-id -i ~/.ssh/<id_rsa> -p <port> <user>@<host>
```

***

### Setup ssh config

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

Check the most important parameters in config

> Проверьте наиболее важные параметры  в конфиге

```bash
Port 2222
LoginGraceTime 2m
AllowUsers <username>, <username>
PermitRootLogin no
PubkeyAuthentication yes
ClientAliveInterval 600
ClientAliveCountMax 0
PasswordAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no
```

> In the parameter AllowUsers, specify a user or several users to which it is allowed to connect

> В параметре AllowUsers укажите пользователя или несколько пользователей к которым разрешено подключаться

***

### Save file `/etc/ssh/sshd_config` and restart ssh

> Сохраняем файл `/etc/ssh/sshd_config` и перезагружаем ssh

```bash
systemctl restart ssh
```

***

### Config ssh connections

> Настроим ssh соединения

On your local computer in the `~/.ssh` folder create and open file

> На вашем локальном компьютере в папке `~/.ssh` создаем и откываем файл

```bash
sudo nano ~/.ssh/config
```

Write to a file according to this structure with our data

> Записываем в файл по данной структуре со своими данными

```bash
Host <name_connection>
Hostname <ip_address>
User <username>
PubKeyAuthentication yes
Port <port>
```

Save file `~/.ssh/config` and connect

> Сохраняем файл `~/.ssh/config` и подключаемся

```bash
ssh <name_connection>
```

***

### Load files by SSH

> Загрузка файлов по SSH

Upload file
```bash
scp <path-to-file> -P <port> <user>@<host>:<path-to-place>
```

Upload directory
```bash
scp -r <path-to-directory> -P <port> <user>@<host>:<path-to-place>
```

Download file
```bash
scp -P <port> <user>@<host>:<path-to-file> <path-to-place>
```

Download directory
```bash
scp -r -P <port> <user>@<host>:<path-to-directory> <path-to-place>
```

If you want to copy all files from directory use <path-to-directory>/*

> Если вы хотите скопировать все файлы из дериктроии, используйте <path-to-directory>/*

&nbsp;

Install and setup OpenVPN
-------------------------
### Download shell script for installation OpenVPN

> Cкачаем shell скрипт для установки OpenVPN

I inherit the installation commands from this guide:
[https://github.com/Nyr/openvpn-install](https://github.com/Nyr/openvpn-install "Setup for install OpenVPN")

> Я наследую команды установки из этого руководства

Use this command for download and run script, then proceed as directed

> Используйте данную команды для загрузки и запуска скрипта, затем действуйте по указаниям

```bash
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh
```

As a result, you will receive a file in directory `/root/<client>.ovpn`. This configuration file connects to VPN

> По результату вы получите файл в деритории `/root/<client>.ovpn`. Этот файл конфигурации подключения к VPN

***

### Start and add to startup

> Запускаем и включаем в автозагрузку

```bash
sudo systemctl start openvpn ; \
sudo systemctl enable openvpn
```

***

### Connecting from local computer

> Подключение с локального компьютера

I have OS Linux/Ubuntu and will demonstrate on it

> Я имею операционную систему Linux/Ubuntu и буду демонстрировать на ней

![VPN](https://fla.codes/media/vpn.png)

Сlick: Import from file... And choose your file `<client>.ovpn`. As a result, you will receive a complete setting for adding VPN. Now click Add

> Нажмите: Импортировать из файла... И выбирите ваш файл `<client>.ovpn`. ПО итогу вы получите полную настройку для добавления VPN. Теперь нажмите: Добавить

![Add VPN](https://fla.codes/media/add-vpn.png)

Successfully!

> Успешно!
