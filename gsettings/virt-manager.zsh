echo; echo "Configuring Virt Manager..."
gset vm xmleditor-enabled true
gset vm.confirm forcepoweroff false
gset vm.confirm removedev false
gset vm.confirm unapplied-dev false
gset vm.connections autoconnect "['qemu:///system']"
gset vm.connections uris "['qemu:///system']"
