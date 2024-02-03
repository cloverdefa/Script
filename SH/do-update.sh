#!/bin/bash

# Update all packages of operating system to latest.
# for displaying upgradeable package count at startup

{ echo -e "\e[5;37;40m Update Packages \e[0m"; } 2> /dev/null
sudo apt-get update

{ echo -e "\e[5;37;40m Dist Upgrade Packages \e[0m"; } 2> /dev/null
sudo pveupgrade

{ echo -e "\e[5;37;40m Remove Dependency Packages That Are No Longer Needed \e[0m"; } 2> /dev/null
sudo apt-get --purge autoremove

{ echo -e "\e[5;37;40m Clean apt Cache \e[0m"; } 2> /dev/null
sudo apt-get clean

exit