{ config, pkgs, ... }:

{
  # Bootloader config
   boot.loader.grub = {
     enable = true;
     device = "nodev";
     useOSProber = true;
     configurationLimit = 10; # Limit the number of generations to keep
   };
}
