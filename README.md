# Dotfiles

Common config files for my Arch environment and associated packages.

## Usage

Clone this repo and run `./bootstrap.sh` from a terminal.

To reverse changes, pass the `cleanup` argument.


#### Dotfiles

The actual dotfiles are handled by [Stow](http://www.gnu.org/software/stow/)
and as such live in the `stowable` directory. Each "package" should have its
own folder containing the various configs.

By default, configs will be linked within `~/.config/<package>`. That can be
changed by dropping a `.stowtarget` file in the package with the desired path.

#### Systemd

To automatically install systemd services and timers, place them inside
the `services/` directory. When running the bootstrap script, they will
be copied to `/etc/systemd/system/` then enabled and started.

Unit/service configurations can also be loaded by placing them inside
`services/`. As long as configs are placed under a `*unit_name*.service.d`
directory, the structure will be mirrored over to the system.

Finally, the daemon is reloaded to ensure and changes get picked up.

## Full System Install

To save time setting up a new Arch Linux install, a lot of the basic stuff
is handled automatically by rootscripts. This way, all you have to do is
prepare the hard drive.

1. Boot to the [Arch ISO](https://wiki.archlinux.org/index.php/Category:Getting_and_installing_Arch) and partition/format the destination drive
2. Install the bare minimum packages:
    ```zsh
    pacstrap /mnt base base-devel git intel-ucode
    ```

3. Generate fstab and switch to chroot:
    ```zsh
    genfstab -U /mnt >> /mnt/etc/fstab
    arch-chroot /mnt /bin/bash
    mkinitcpio -p linux # optional
    ```

4. Clone the dotfiles, set root password and reboot:

    > **Note**
    >
    > The repo must be cloned prior to rebooting. The `1st-boot.sh` script
    > will enable and start DHCP on the main network interface, but that's
    > not really much use if there's no connection to get the script with.

    ```zsh
    git clone https://github.com/dshoreman/dotfiles.git /root/dotfiles
    passwd
    exit
    umount -R /mnt
    reboot
    ```

5. Start the script and follow the instructions:
    ```zsh
    exec ./dotfiles/1st-boot.sh
    ```
