# Playbooks


## Depend


### Base
- [ ] Создание пользователя с нужными правами
- [ ] Добавление базовых пакетов
    - git
    - vim
    - mc
    - nano
    - part...
    - ...
- [ ] Настройка Fairwall
- [ ] Настройка SSH
    - [ ] Публичный ключ
    - [ ] Смена порта (для безопасности)
- [ ] Настройка Fail2Ban (DDOS - защита)
    - [ ] Для SSH
    - [ ] Для Nextcloud

### Let's ancrypt
- [ ] Настройка доступа по https (для безопасности)
    - [ ] Выпуск TLS сертификата
    - [ ] Установка TLS сертификата
    - [ ] Настройка автоматического перевыпуска сертификата (чтобы не обновлять раз в 3 месяца и избежать блокировки сервиса)


### Zabbix Agent
- [ ] Установка Zabbix агента для Linux


### Docker

- [x] Установка среды контейнеризации
    - [x] Docker (контейнеризация)
    - [x] Docker compose (оркестрация)


## Apps


### Zabbix
- [ ] Установка Zabbix-сервера
- [ ] Настройка резервного копирования

### Prometeus
- [ ] Установка Prometeus-сервера
- [ ] Настройка резервного копирования

### Graphana
- [ ] Установка Graphana-сервера
- [ ] Настройка резервного копирования

### Outline
- [ ] Установка Outline
- [ ] Подключение AI
- [ ] Настройка резервного копирования


### NextCloud

NextCloud в docker кластере

- [x] Nginx
    - TLS - соединение
    - Безопасность

- [x] MariaDB
    - DB для nextcloud

- [x] Redis
    - Кеш для ускорения

- [x] Nextcloud
    - Файловый сервер

- [x] Harp
    - Автоматическое поднятия docker контейнеров для плагинов
    - [x] Подключение к docker-socks на хосте
    - [ ] Автоматическое прописание в nextcloud (Чтобы ручками не добавлять)
    - [ ] Подключение к docker-socks на других хостах

- [ ] onlyoffice
    - Редактирования документов в браузере
    - [x] Установка
    - [ ] Подключение

- [ ] Настройка автоматизации резервного копирования


## Использование

```bash
# Запуск playbook
ansible-playbook playbooks/nextcloud.yml

# Запуск playbook с конкретным inventory
ansible-playbook -i ./inventory/prod.yml playbooks/nextcloud.yml

# Запуск playbook с конкретного task'а
ansible-playbook playbooks/nextcloud.yml --start-at-task="4.0 Install git"

# Фиксит баг
docker compose run --rm nextcloud-db sh -c "rm -f /var/lib/mysql/tc.log"
```


## Типовой flow:

- Установить Docker
- Создать директории
- Скопировать docker-compose.yml
- Сгенерить .env из Vault/AWX secrets
- Сделать backup volumes
- docker compose pull
- docker compose up -d


## Upgrade AWX Job:

- Backup volumes
- docker compose pull
- docker compose up -d
- Healthcheck
