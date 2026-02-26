
```bash
#!/bin/bash
BACKUP_DIR=~/glpi-backups
DATE=$(date +%Y%m%d_%H%M%S)

# Загрузить переменные из .env
source .env

mkdir -p $BACKUP_DIR

# Бэкап базы
docker run --rm \
  --network glpi_default \
  -v $BACKUP_DIR:/backup \
  -e MYSQL_PWD=$GLPI_DB_PASSWORD \
  mysql:latest \
  mysqldump -h db -u $GLPI_DB_USER $GLPI_DB_NAME > $BACKUP_DIR/glpi-db-$DATE.sql

# Бэкап файлов GLPI
docker run --rm \
  -v glpi_glpi_data:/source:ro \
  -v $BACKUP_DIR:/backup \
  alpine \
  tar czf /backup/glpi-data-$DATE.tar.gz -C /source .

echo "✅ Бэкап создан в $BACKUP_DIR"
```
