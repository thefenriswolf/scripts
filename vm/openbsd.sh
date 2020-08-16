#!/bin/bash

qemu-system-x86_64 -enable-kvm -smp 4 -m 2G -drive file=~/vm/openbsd.raw,format=raw \
                  # -cdrom ~/vm/iso/openbsd67.iso \
                  # -boot order=d
