Удаленное подключение по SSH
----------------------------

### Автозагрузка и настройка конфигов

> Добавляет в автозагрузку.

```shell
sudo systemctl enable ssh
```

> Проверяет работоспособность.

```shell
ssh localhost
```

> Копирует стандартный конфиг в `sshd_config.default`.

```shell
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.default
```

> Открывает, настраивает `sshd_config`.

```shell
sudo nano /etc/ssh/sshd_config
```

```shell
# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Include /etc/ssh/sshd_config.d/*.conf

Port 2222
```

```shell
# Authentication:

PermitRootLogin no
AllowUsers <username>
```

```shell
# To disable tunneled clear text passwords, change to no here!
PasswordAuthentication no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no
```

> Перезагружает сервис OpenSSH.

```shell
sudo systemctl restart ssh
```

---

## Создание ключей и папки `.ssh`

> Создает папку `.ssh`.

```shell
mkdir $HOME/.ssh
```

> Выдает права на папку `.ssh`.

```shell
chown -R $USER:$USER $HOME/.ssh/; \
chmod -R 700 $HOME/.ssh/
```

> Генерирует RSA ключи, публичный и приватный.

```shell
ssh-keygen -t rsa
```

> Добавляет локально сгенерированный ключ в `authorized_keys` на сервере.

```shell
ssh-copy-id -i $HOME/.ssh/id_rsa <username>@example.com
```

> Выдает права файлам в папке `.ssh`.

```shell
chmod 644 $HOME/.ssh/*; \
chmod 600 $HOME/.ssh/id_rsa $HOME/.ssh/id_rsa.pub $HOME/.ssh/authorized_keys
```

---

### Настройка подключения к серверу

> Настраивает подключение к серверу по ключевому слову.

```shell
sudo nano $HOME/.ssh/config
```

```shell
Host example
Hostname example.com
User <username>
PubKeyAuthentication yes
Port 2222
```

> Подключает к серверу.

```shell
ssh example
```

---

### Манипуляции через SSH

> Загружает через scp.

```shell
scp example.txt example:<path-to-place>
```

```shell
scp -r example/ example:<path-to-place>
```

> Скачивает через scp.

```shell
scp example:/example.txt <path-to-place>
```

```shell
scp -r example:/example/ <path-to-place>
```
