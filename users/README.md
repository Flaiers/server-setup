Работа с пользователями
-----------------------

### Создание

> Обычный пользователь с правами sudo.
```shell
sudo useradd -m -G sudo -s /usr/bin/zsh -p <password> <username>
```

> Пользователь с группой sudo и правами root.
```shell
sudo useradd -m -o -u 0 -g 0 -s /usr/bin/zsh -p <password> <username>
```

### Права

> Настройка sudo без пароля.
```shell
sudo visudo
```

```shell
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) NOPASSWD:ALL
```

### Удаление

> Принудительное удаление вместе с домашней директорией.
```shell
sudo userdel -f -r <username>
```
