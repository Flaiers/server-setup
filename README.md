All about setup Debian and Ubuntu server
========================================
### *Note: for Debian 10.+ and Ubuntu 20.+ versions*

1. ### [Using VPN](#install-and-setup-openvpn)
    * [Installing](#download-shell-script-for-installation-openvpn)
    * [Adding to Startup](#start-and-add-to-startup)
    * [Connecting](#connecting-from-local-computer)

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
