RM_SUF := -
SYSTEMCTL_CMD := systemctl --user --now
SERVICE := idle-inhibitor.service
DST := /usr/bin/idle-inhibitor.sh /usr/lib/systemd/user/$(SERVICE)
RM_DST := $(addsuffix $(RM_SUF),$(DST))

.PHONY: install remove
install: $(DST) enable_service
remove: disable_service $(RM_DST)

$(DST):
	sudo cp $(@:$(@D)/%=%) $(@)

enable_service:
	sudo systemctl daemon-reload
	$(SYSTEMCTL_CMD) enable $(SERVICE)

$(RM_DST):
	sudo rm $(@:%$(RM_SUF)=%)

disable_service:
	$(SYSTEMCTL_CMD) disable $(SERVICE)
	sudo systemctl daemon-reload
