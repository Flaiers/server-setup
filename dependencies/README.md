Установка зависимостей
----------------------

### apt-get пакеты

> Обновляет индекс пакетов в Linux, а затем обновляет устаревшие пакеты до последних версий.

```shell
sudo apt-get update && sudo apt-get upgrade
```

> Скачивает нужные пакеты для разработки на python и для дальнейшей настройки сервера.

```shell
sudo apt-get install -y openssh-server vim zsh fonts-powerline mosh htop git curl wget unzip zip make python3-dev python3-lxml python3 build-essential libssl-dev libffi-dev python3-pip python3-venv tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libbz2-dev libexpat1-dev libpcre3  libpcre3-dev liblzma-dev zlib1g zlib1g-dev apt-transport-https ca-certificates software-properties-common libsqlite3-dev
```

---

### Последняя версия python

> Скачивает и распаковывает архив.

```shell
curl -fOsSL https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tar.xz && \
tar -xvf Python-3.10.0.tar.xz
```

> Создает папку `.python` в домашней директории пользователя и конфигурирует в нее python.

```shell
cd Python-3.10.0 && mkdir $HOME/.python && \
./configure --enable-loadable-sqlite-extensions --enable-optimizations --prefix=$HOME/.python
```

> Устанавливает python.

```shell
make && sudo make altinstall
```

> Обновляет ссылку на установленный python и скачивает пакеты pip.

```shell
sudo update-alternatives --install /usr/bin/python python $HOME/.python/bin/python3.10 10 && \
sudo update-alternatives --config python && \
python -m pip install -U pip
```

---

### Docker

> Добавляет gpg ключ для официального репозитория Docker в систему.

```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

> Добавляет репозиторий Docker в источники apt.

```shell
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

> Обновляет индекс пакетов.

```shell
sudo apt-get update
```

> Проверяет, что установка будет выполняться из репозитория Docker, а не из репозитория Ubuntu.

```shell
apt-cache policy docker-ce
```

```shell
docker-ce:
  Installed: (none)
  Candidate: 5:20.10.12~3-0~ubuntu-focal
  Version table:
     5:20.10.12~3-0~ubuntu-focal 500
        500 https://download.docker.com/linux/ubuntu focal/stable amd64 Packages
```

> Устанавливает Docker.

```shell
sudo apt-get install -y docker-ce
```

> Показывает текущую версию Docker.

```shell
docker --version
```

> Включает docker в автозагрузку.

```shell
sudo systemctl enable docker
```

---

### Docker Compose

> Загружает версию `2.2.2` и сохраняет исполняемый файл в каталоге `/usr/local/bin/docker-compose`, в результате чего данное программное обеспечение будет глобально доступно под именем docker-compose.

```shell
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

> Задает правильные разрешения, чтобы сделать команду docker-compose исполняемой.

```shell
sudo chmod +x /usr/local/bin/docker-compose
```

> Показывает текущую версию Docker Compose.

```shell
docker-compose --version
```

---

### Дополнительный софт

> Устанавливает oh-my-zsh.

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

> Открывает, редактирует `ZSH_THEME=` в файле `.zshrc`.

```shell
nano $HOME/.zshrc
```

```shell
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
```

> Устанавливает OpenVPN.

```shell
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh
```

_Источник: [https://github.com/Nyr/openvpn-install](https://github.com/Nyr/openvpn-install "OpenVPN")_

> Запускает и добавляет OpenVPN в автозагрузку.

```shell
sudo systemctl start openvpn & \
sudo systemctl enable openvpn
```

> Устанавливает WireGuard.

```shell
wget https://git.io/wireguard -O wireguard-install.sh && bash wireguard-install.sh
```

_Источник: [https://github.com/Nyr/wireguard-install](https://github.com/Nyr/wireguard-install "WireGuard")_
