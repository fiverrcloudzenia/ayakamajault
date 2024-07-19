```sudo nano /usr/local/bin/etcdbackup.sh```

```sudo chmod +x /usr/local/bin/etcdbackup.sh```

```sudo crontab -e```
Add the following line to run the backup script daily at 2 AM:
```0 2 * * * /usr/local/bin/etcdbackup.sh```
