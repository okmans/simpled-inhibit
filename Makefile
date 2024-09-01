NAME := idle-inhibitor
SERVICE := $(NAME).service

SYSTEMCTL_CMD := systemctl --user --now
SYSTEMCTL_RELOAD := sudo systemctl daemon-reload

DST := /usr/bin/$(NAME).sh /usr/lib/systemd/user/$(SERVICE)

.PHONY: install remove
install: $(DST) | enable

$(DST):
	sudo cp $(@:$(@D)/%=%) $(@)
enable:
	$(SYSTEMCTL_RELOAD)
	$(SYSTEMCTL_CMD) enable $(SERVICE)

remove:
	$(SYSTEMCTL_CMD) disable $(SERVICE)
	$(SYSTEMCTL_RELOAD)
	sudo rm $(DST)
