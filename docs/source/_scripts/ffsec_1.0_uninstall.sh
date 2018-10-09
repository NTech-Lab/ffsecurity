#!/bin/bash

FF_PACKAGES="ntls fkvideo-detector findface-extraction-api findface-postgres-9.5-facen ffsecurity ffsecurity-ui findface-data* grd-udev libnnd-data ntech-env videopipe-data findface-security-repo"
SIDE_PACKAGES="nginx redis-server redis-tools"
ALL_PACKAGES="$FF_PACKAGES $SIDE_PACKAGES"
FF_SERVICES="ntls findface-extraction-api 'findface-security-proto*' 'fkvideo*' postgresql@9.5-main.service"


now=$(date +"%m_%d_%Y.%H:%M")
bdir=ffsec_bak

echo "
##############################################################################
#                                                                            #
# ! This script will remove FindFace Security instance from current server ! #
#                                                                            #
          Config files and DB will be backed up to ~/$bdir/.
#                                                                            #
##############################################################################
"

backupCfg() {
    mkdir $HOME/$bdir/
    mkdir $HOME/$bdir/etc/
    mkdir $HOME/$bdir/etc/ffsecurity/
    mv /etc/ffsecurity/config.py $HOME/$bdir/etc/ffsecurity/config_$now.py.bak
    for cfg in /etc/{{findface-extraction-api,fkvideo*}.ini,ntls.cfg};
    do
        if [ -f "$cfg" ]; then
            mv "$cfg" "$HOME/$bdir/${cfg}_$now.bak"
            echo "File $cfg found and deleted. Backup created."
        else
            echo "NO such file or directory $cfg"
        fi
    done
}

backupFfupload() {
  tar -cvzf $HOME/$bdir/uploads_$now.tar.gz /var/lib/ffsecurity/uploads
}

backupRedisDB() {
  redis-cli << EOF
save
EOF
  mv /var/lib/redis/dump.rdb $HOME/$bdir/dump_$now.rdb
  echo "Database (redis) backup created in ~/$bdir/."
}

backupPostgresDB() {
  sudo -u postgres pg_dump ffsecurity > ~/$bdir/ffsecurity_backup_$now.sql
  echo "Database (postgres ffsecurity) backup created in ~/$bdir/."
}

backupNginxCfg() {
    mkdir $HOME/$bdir/etc/nginx/
    mkdir $HOME/$bdir/etc/nginx/sites-enabled/
    cp /etc/nginx/sites-enabled/ntls $HOME/$bdir/etc/nginx/sites-enabled/
    cp /etc/nginx/sites-enabled/ffsecurity-nginx.conf $HOME/$bdir/etc/nginx/sites-enabled/
}

uninstallAll() {
  service $FF_SERVICES stop

  backupCfg
  backupPostgresDB
  backupNginxCfg
  backupRedisDB
  backupFfupload

  echo "##############################################################################
  ##############################################################################"
  sudo -u postgres dropdb -i ffsecurity
  apt-get -y purge $ALL_PACKAGES

  rm /etc/nginx/ntls.htpasswd
  rm -rf /opt/ntech
  rm -rf /var/findface-security-repo
  rm -rf /var/lib/ffsecurity
  rm -rf /usr/share/ffsecurity-ui
  rm -rf /opt/ffsecurity
  rm /etc/nginx/sites-enabled/ntls
  rm /etc/nginx/sites-enabled/ffsecurity-nginx.conf
  rm /etc/apt/sources.list.d/ntechlab.list

  service nginx restart
  systemctl daemon-reload
  apt-get update
}

while true; do
    read -p "
all     = uninstall all server components (include neural network) and wipe all saved faces.
no      = cancel operation.
Please select one

> " asc
    case $asc in
    all ) uninstallAll; break;;
    no ) exit;;
        * ) echo "

############################
Please answer all/no.";;
    esac
done

echo "Done"
