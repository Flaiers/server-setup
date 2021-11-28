Установка зависимостей
----------------------

### Обновление и установка apt-get пакетов

> Обновление индекса пакетов в Linux, а затем обновление устаревших пакетов до последних версий.
```shell
sudo apt-get update && sudo apt-get upgrade
```

> Скачивание нужных пакетов для разработки на python и для дальнейшей настройки сервера.
```shell
sudo apt-get install -y openssh-server nginx vim zsh mosh htop git curl wget unzip zip make python3-dev python3-lxml supervisor python3 build-essential libssl-dev libffi-dev python3-pip python3-venv tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libbz2-dev libexpat1-dev libpcre3 libpcre3-dev liblzma-dev zlib1g zlib1g-dev
```

***

### Установка последней версии python

> Скачивание и распаковка архива.
```shell
curl -o python.tar.xz https://python.org/ftp/python/3.10.0/Python-3.10.0.tar.xz && \
tar -xvf python.tar.xz
```

> Создание папки `.python` в домашней директории пользователя и конфигурация python в нее.
```shell
cd python && \
mkdir $HOME/.python && \
./configure --enable-optimizations --prefix=$HOME/.python
```

> Установка python.
```shell
make && sudo make altinstall
```

> Обновление ссылки на новый установленный python и скачивание пакетов pip.
```shell
sudo update-alternatives --install /usr/bin/python python $HOME/.python/bin/python3.10 10 && \
sudo update-alternatives --config python && \
python -m pip install -U pip
```

***

### Дополнительный софт

> Установка oh-my-zsh и powerline fonts.
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
sudo apt-get install fonts-powerline
```

> Смена темы, редактирование `ZSH_THEME=` в файле `.zshrc`.
```shell
nano $HOME/.zshrc
```

```shell
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/www/.oh-my-zsh"

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