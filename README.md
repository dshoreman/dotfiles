# Dotfiles

These dotfiles are handled internally by [Stow] and live in the `stowable` directory.  
Each "package" has its own folder containing the various configs.

By default, configs are linked from within `~/.config/<package>`.  
To change the default, create a `.stowtarget` file in the package with the desired path.

## Usage

* Clone this repo and run `stowable/bin/dotfiles` from a terminal.
* To reverse changes, run `dotfiles clean`. To re-stow, just run `dotfiles`.

## Full System Install

Setting up a new Arch Linux system is handled by DASHit.

1. Obtain and boot the latest [Arch ISO](https://wiki.archlinux.org/index.php/Category:Getting_and_installing_Arch)
2. Configure and run [DASHit]:
    ```bash
    export DASHIT_ENVIRONMENTS="i3,sway"
    export DASHIT_DOTFILES_BRANCH="master"
    export DASHIT_DOTFILES_REPO="https://github.com/dshoreman/dotfiles.git"

    export DASHIT_BROWSERS="chromium,firefox,vivaldi"
    export DASHIT_TERMINALS="foot,kitty,alacritty"
    export DASHIT_EXTRA_EXTRACTORS=1
    export DASHIT_EXTRA_UTILS=1

    export DASHIT_FF_LOCALE="en-gb"
    export DASHIT_SIZE_ESP=779
    export DASHIT_SIZE_SWAP=35

    curl -Lo dashit https://github.com/dshoreman/dashit/releases/latest/download/dashit
    chmod +x dashit

    ./dashit -v -d /dev/nvme0n1
    ```

[DASHit]: https://github.com/dshoreman/dashit
[Stow]: http://www.gnu.org/software/stow/
