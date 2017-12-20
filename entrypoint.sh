#!/bin/sh

/usr/bin/libreoffice --nologo --norestore --invisible --nolockcheck --nodefault --headless "$@"
if [ -d "/tmp/hsperfdata_root" ]; then
	rm -rf /tmp/hsperfdata_root
fi