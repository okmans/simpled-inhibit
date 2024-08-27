SYSTEMCTL_CMD := systemctl --user --now
SYSTEMCTL_RELOAD := sudo systemctl daemon-reload
SERVICE := idle-inhibitor.service

DST := /usr/bin/idle-inhibitor.sh /usr/lib/systemd/user/$(SERVICE)
RM_PREF := -
RM_DST := $(addprefix $(RM_PREF),$(DST))

.PHONY: install remove
install: $(DST) enable_service
remove: disable_service $(RM_DST)

$(DST):
	sudo cp $(@:$(@D)/%=%) $(@)

enable_service:
	$(SYSTEMCTL_RELOAD)
	$(SYSTEMCTL_CMD) enable $(SERVICE)

$(RM_DST):
	sudo rm $(@:$(RM_PREF)%=%)

disable_service:
	$(SYSTEMCTL_CMD) disable $(SERVICE)
	$(SYSTEMCTL_RELOAD)
