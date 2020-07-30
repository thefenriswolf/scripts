#!/bin/sh

tarsnap -c --print-stats \
	-f "ubuntu-thinkpad-$(date +%Y-%m-%d_%H-%M-%S)" \
	/home/stefan/Dokumente
