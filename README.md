# Dotfiles

Common config files for my Arch environment and associated packages.

## Usage

Clone this repo and run `./bootstrap.sh` from a terminal.

To reverse changes, pass the `cleanup` argument.


### Systemd

To automatically install systemd services and timers, place them inside
the `services/` directory. When running the bootstrap script, they will
be copied to `/etc/systemd/system/` then enabled and started.

Unit/service configurations can also be loaded by placing them inside
`services/`. As long as configs are placed under a `*unit_name*.service.d`
directory, the structure will be mirrored over to the system.

Finally, the daemon is reloaded to ensure and changes get picked up.
