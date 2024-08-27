# Idle inhibition service

This is a simple and straightforward idle inhibition control service based on
`systemd-inhibit` and ALSA.

The service enables idle inhibition if sound is played, and disables it if
sound isn't played.

The service may be useful for homemade desktop environments based on `i3wm`,
`sway`, `dwm`, etc. that don't have a shell that controls idle inhibition.

## Installation & deinstallation

Use `make install` to install and `make remove` to deinstall.

## Documentation & links

- [ALSA](https://alsa.opensrc.org/Proc_asound_documentation)
- [systemd-inhibit](https://www.man7.org/linux/man-pages/man1/systemd-inhibit.1.html)
