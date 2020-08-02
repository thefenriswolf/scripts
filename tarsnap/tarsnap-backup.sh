#!/bin/bash

archive_name=$2

function ts_backup() {
tarsnap -c --print-stats \
	-f "ubuntu-thinkpad-$(date +%Y-%m-%d_%H-%M-%S)" \
	/home/stefan/Dokumente
if [ $? -eq 0 ]; then
    echo "backup was SUCCESSFUL at: $(date +%Y-%m-%d_%H-%M-%S)" >> ~/.ts_backup.log

else
    echo "backup FAILED at: $(date +%Y-%m-%d_%H-%M-%S)" >> ~/.ts_backup.log
fi
}

function ts_list_backups() {
    echo $(tarsnap --list-archives)
}

function ts_delete() {
    tarsnap -d -f $archive_name
}


function ts_restore() {
    tarsnap -x -f $archive_name
}

function ts_help() {
    echo -e "
  _                                         _                _                     _     
 | |_ __ _ _ __ ___ _ __   __ _ _ __       | |__   __ _  ___| | ___   _ _ __   ___| |__  
 | __/ _' | '__/ __| '_ \ / _' | '_ \ _____| '_ \ / _' |/ __| |/ / | | | '_ \ / __| |_ \ 
 |  | (_| | |  \__ \ | | | (_| | |_) |_____| |_) | (_| | (__|   <| |_| | |_) |\__ \ | | |
  \__\__,_|_|  |___/_| |_|\__,_| .__/      |_.__/ \__,_|\___|_|\_\\__,_| .__(_)___/_|  |_|
                               |_|                                     |_|               

"
    echo -e "backup, list restore, delete, help"
}
case $1 in
    backup | b)
	ts_backup
	;;
    list | ls)
	ts_list_backups
	;;
    restore | rollback)
	ts_restore
	;;
    delete | purge | rm)
	ts_delete
	;;
    help | h)
	ts_help
	;;
    *)
	ts_help
	;;
esac
