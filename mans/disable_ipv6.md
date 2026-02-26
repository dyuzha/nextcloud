*CloudInit* настраивает *VM* на работу с *IPv6*

Необходимо отключить *IPv6* на уровне *GRUB*:
    - Добавить строчку `ipv6.disable=1` в директиву `GRUB_CMDLINE_LINUX` в файле `/etc/default/grub`
    - Перегенерировать grub config
    - Перезагрузить систему

Было
```bash
cat /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT=""
GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0,115200 earlyprintk=ttyS0,115200 consoleblank=0"
GRUB_TERMINAL_OUTPUT="gfxterm serial"
GRUB_SERIAL_COMMAND="serial --speed=115200"
```

Стало
```bash
cat /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT=""
GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0,115200 earlyprintk=ttyS0,115200 consoleblank=0 ipv6.disable=1"
GRUB_TERMINAL_OUTPUT="gfxterm serial"
GRUB_SERIAL_COMMAND="serial --speed=115200"
```
После выполнить
```bash
sudo update-grub
sudo reoot
```
*Команда sudo update-grub — генерирует новый файл конфигурации GRUB, основываясь на настройках из файла /etc/default/grub и скриптах из каталога /etc/grub.d/*
