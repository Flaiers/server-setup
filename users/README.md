Работа с пользователями
-----------------------

### Создание

> Создает обычного пользователья с правами sudo.

```shell
sudo useradd -m -G sudo,docker -s /usr/bin/zsh -p <password> <username>
```

> Создает пользователя с группой sudo и правами root.

```shell
sudo useradd -m -o -u 0 -g 0 -s /usr/bin/zsh -p <password> <username>
```

---

### Права

> Открывает, настраивает sudo без пароля.

```shell
sudo visudo
```

```shell
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) NOPASSWD:ALL
```

---

### Удаление

> Принудительно удаляет пользователя с домашней директорией.

```shell
sudo userdel -f -r <username>
```
