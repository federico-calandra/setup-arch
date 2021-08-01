# avvia X al login su TTY1
if [ -z "${DISPLAY}"  ] && [ "${XDG_VTNR}" -eq 1  ]; then
	exec startx
fi
