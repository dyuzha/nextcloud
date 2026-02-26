# Увеличение диска
---

## Увеличение диска на proxMox в GUI
---
В GUI:
    1. Выбрать ВМ
    2. Hardware (Оборудование)
    3. Выбрать диск (скорей всего scsi0)
    4. Действия над диском
    5. Resize (Изменить раздел)

В консоле:
```bash
qm resize <VMID> <disk> +<SIZE>
```

## Увеличиваем диск в Linux
---
1. Установка cloud-guest-utils (включает growpart)
```bash
# Debian
sudo apt update && sudo apt install cloud-guest-utils -y

# RHEL
sudo yum install cloud-utils-growpart -y
```

2. Определить раздел для расширения
```bash
# До расширения
lsblk

# Вывод
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda       8:0    0    3G  0 disk
├─sda1    8:1    0  2.9G  0 part /
├─sda14   8:14   0    3M  0 part
└─sda15   8:15   0  124M  0 part /boot/efi
sr0      11:0    1    4M  0 rom
sr1      11:1    1 1024M  0 rom

# После раширения
lsblk

# Вывод
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda       8:0    0   30G  0 disk
├─sda1    8:1    0  2.9G  0 part /
├─sda14   8:14   0    3M  0 part
└─sda15   8:15   0  124M  0 part /boot/efi
sr0      11:0    1    4M  0 rom
sr1      11:1    1 1024M  0 rom
```
3. Расширение таблиц разделов
```bash
sudo growpart /dev/sda 1
# CHANGED: partition=1 start=262144 old: size=6027264 end=6289407 new: size=62652383 end=62914526
```
4. Расширение файловой системы
```bash
sudo resize2fs /dev/sda1

# Вывод
resize2fs 1.47.2 (1-Jan-2025)
Filesystem at /dev/sda1 is mounted on /; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 4
The filesystem on /dev/sda1 is now 7831547 (4k) blocks long.

lsblk

# Вывод
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda       8:0    0   30G  0 disk
├─sda1    8:1    0 29.9G  0 part /
├─sda14   8:14   0    3M  0 part
└─sda15   8:15   0  124M  0 part /boot/efi
sr0      11:0    1    4M  0 rom
sr1      11:1    1 1024M  0 rom
```
