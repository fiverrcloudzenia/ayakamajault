#!/bin/bash

# Ensure the backup directory exists
BACKUP_DIR="/tmp/client"
mkdir -p $BACKUP_DIR

# Stop K3s server
systemctl stop k3s

# Create etcd backup
tar -czvf $BACKUP_DIR/etcd-data-backup-$(date +%F).tar.gz /var/lib/rancher/k3s/server/db

# Start K3s server
systemctl start k3s
