#!/bin/bash

SIDE_PACKAGES="nginx redis-server redis-tools etcd etcd-client etcd-server"
FF_SERVICES="'findface-security-worker*' postgresql@9.5-main.service findface-videomanager-api 'fkvideo*' video-worker 'findface-security-proto*' findface-extraction-api ntls nginx etcd"

findface_pkg=$(sudo dpkg -l | grep -E "videopipe-data|findface|fkvideo|ntls|ffsecurity|ntech" | awk '{print $2}')

now=$(date +"%m_%d_%Y.%H:%M")
bdir=ffsec_bak_$now

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
    mv /etc/ffsecurity/config.py $HOME/$bdir/etc/ffsecurity/config.py.bak
    for cfg in /etc/{{findface-extraction-api,fkvideo*,video-worker}.ini,findface-videomanager-api.conf,ntls.cfg};
    do
        if [[ -f "$cfg" ]]; then
            mv "$cfg" "$HOME/$bdir/${cfg}.bak"
            echo "File $cfg found and deleted. Backup created."
        else
            echo "NO such file or directory $cfg"
        fi
    done
}

backupFfupload() {
  tar -cvzf $HOME/$bdir/var_lib_ffsecurity_uploads.tar.gz /var/lib/ffsecurity/uploads
}

backupETCD() {
  tar -cvzf $HOME/$bdir/var_lib_etcd_default.tar.gz /var/lib/etcd/default
}

backupRedisDB() {
  redis-cli << EOF
save
EOF
  mv /var/lib/redis/dump.rdb $HOME/$bdir/dump.rdb
  echo "Database (redis) backup created in ~/$bdir/."
}

backupPostgresDB() {
  sudo -u postgres pg_dump ffsecurity > ~/$bdir/ffsecurity_backup.sql
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
  backupETCD
  backupNginxCfg
  backupRedisDB
  backupFfupload

  echo "##############################################################################
  ##############################################################################"
  sudo -u postgres dropdb -i ffsecurity
  apt-get purge $findface_pkg
  dpkg --remove $SIDE_PACKAGES

  rm /etc/nginx/ntls.htpasswd
  rm -rf /opt/ntech
  rm -rf /var/findface-security-repo
  rm -rf /var/lib/ffsecurity
  rm -rf /etc/ffsecurity
  rm -rf /usr/share/ffsecurity-ui
  rm -rf /opt/ffsecurity
  rm -rf /var/lib/etcd/default
  rm /etc/nginx/sites-enabled/ntls
  rm /etc/nginx/sites-enabled/ffsecurity-nginx.conf
  rm /etc/nginx/sites-available/ntls
  rm /etc/nginx/sites-available/ffsecurity-nginx.conf
  rm /etc/apt/sources.list.d/ntechlab.list

  service nginx start
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
