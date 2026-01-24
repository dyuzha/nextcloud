1. Настройка SSH
    - Публичный ключ
    - Смена порта (для безопасности)

2. Настройка Fail2Ban (ddos)
    - Для SSH
    - ... для других сервисов

3. Установка среды контейнеризации
    - Docker (контейнеризация)
    - Docker compose (оркестрация)

4. Настройка доступа по https (для безопасности)
    - Выпуск TLS сертификата
    - Установка TLS сертификата
    extra:
    - Настройка автоматического перевыпуска сертификата (чтобы не обновлять раз в 3 месяца и избежать блокировки сервиса)

5. Установка, настройка nginx (для безопасности)
6. Установка, настройка базы данных
7. Установка, настройка базы кеширования (для ускорения)
8. Установка, настройка nextcloud
9. Установка, подключение onlyoffice (для редактирования документов)
10. Настройка автоматизации резервного копирования

nextcloud-infra/
├── inventories/
│   └── prod.yml
├── playbooks/
│   └── nextcloud.yml
├── roles/
│   ├── docker/
│   ├── nextcloud/
│   │   ├── files/docker-compose.yml
│   │   ├── templates/.env.j2
│   │   └── tasks/main.yml
│   └── backups/


```bash
export ANSIBLE_ROLES_PATH=./roles

ansible-playbook -i ./inventories/prod.yml ./playbooks/nextcloud.yml

ansible-playbook -i ./inventories/prod.yml ./playbooks/nextcloud.yml --start-at-task="State docker network"
Create .env from .env.j2
```


## Типовой flow:
---
- Установить Docker
- Создать директории
- Скопировать docker-compose.yml
- Сгенерить .env из Vault/AWX secrets
- Сделать backup volumes
- docker compose pull
- docker compose up -d

## Upgrade AWX Job:
---
- Backup volumes
- docker compose pull
- docker compose up -d
- Healthcheck
