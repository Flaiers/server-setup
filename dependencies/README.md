Установка зависимостей
----------------------

### apt-get пакеты

> Обновляет индекс пакетов в Linux, а затем обновляет устаревшие пакеты до последних версий.
```shell
sudo apt-get update && sudo apt-get upgrade
```

> Скачивает нужные пакеты для разработки на python и для дальнейшей настройки сервера.
```shell
sudo apt-get install -y openssh-server nginx vim zsh mosh htop git curl wget unzip zip make python3-dev python3-lxml python3 build-essential libssl-dev libffi-dev python3-pip python3-venv tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libbz2-dev libexpat1-dev libpcre3 libpcre3-dev liblzma-dev zlib1g zlib1g-dev
```

***

### Последняя версия python

> Скачивает и распаковывает архив.
```shell
curl -fOsSL https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tar.xz && \
tar -xvf Python-3.10.0.tar.xz
```

> Создает папку `.python` в домашней директории пользователя и конфигурирует в нее python.
```shell
cd Python-3.10.0 && mkdir $HOME/.python && \
./configure --enable-optimizations --prefix=$HOME/.python
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

***

### Дополнительный софт

> Устанавливает oh-my-zsh и powerline fonts.
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; \
sudo apt-get install fonts-powerline
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