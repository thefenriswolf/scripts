#!/bin/bash

qemu-system-x86_64 -enable-kvm -smp 4 -m 6G \
                    -hda /dev/zvol/rpool/USERDATA/stefan_ztoylu/vm/manjaro,format=raw \
                   -cdrom ~/vm/iso/manaro-architect-20.0.3-200607-linux56.iso \
                   -boot order=d
