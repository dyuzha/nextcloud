



```bash
sudo apt install qemu-guest-agent

# Запустить (Необязательно)
sudo systemctl start qemu-guest-agent.service

# (!!!) Активация не сработает, так как отсутсвует директива [[Install]]
sudo systemctl start qemu-guest-agent.service

# Проверить, что после запуска все работает
sudo reboot
sudo systemctl status qemu-guest-agent.service
```

*qemu-guest-agent* не предназначен для включения обычным способом через `systemctl enable`, потому что он запускается по-другому — через *udev*.

Когда виртуальная машина определяет, что к ней подключено специальное устройство канала связи с хостом (*virtio-serial*), *udev* автоматически запускает *qemu-guest-agent*

(*После перезагрузке, автоматически будет запускаться*)
