#!/bin/bash

archive_name=$2

function ts_backup() {
tarsnap -c --print-stats \
	-f "ubuntu-thinkpad-$(date +%Y-%m-%d_%H-%M-%S)" \
	/home/stefan/Dokumente
}

function ts_list_backups() {
    echo $(tarsnap --list-archives | sort)
}

function ts_delete() {
    tarsnap -d -f $archive_name
}


function ts_restore() {
    tarsnap -x -f $archive_name
}

function ts_help() {
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
