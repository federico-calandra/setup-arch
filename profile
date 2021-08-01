# Questo file viene eseguito dopo il login su TTY1

# Fai partire X11
if [ -z "${DISPLAY}"  ] && [ "${XDG_VTNR}" -eq 1  ]; then
	exec startx
fi
