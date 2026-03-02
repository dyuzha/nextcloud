#!/bin/bash
# Backup Docker volume
# Использование: ./backup.sh <volume_name> </path/to/backup>

# BACKUP_DIR=${2:-/tmp/backups}
VOLUME=$1
BACKUP_DIR=${2}
DATE=$(date +%Y%m%d)

# Создаем директорию с родительскими каталогами (при необходимости)
mkdir -p $BACKUP_DIR

echo "📦 Бэкап тома $VOLUME -> $BACKUP_DIR/${VOLUME}_$DATE.tar.gz"


docker run --rm \
  -v $VOLUME:/data \
  -v $BACKUP_DIR:/backup \
  alpine \
  tar czf /backup/${VOLUME}_$DATE.tar.gz -C /data .

echo "✅ Готово: $BACKUP_DIR/${VOLUME}_$DATE.tar.gz"
ls -lh $BACKUP_DIR/${VOLUME}_$DATE.tar.gz
