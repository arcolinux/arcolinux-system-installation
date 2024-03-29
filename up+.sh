#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

# reset - commit your changes or stash them before you merge
# git reset --hard - personal alias - grh

workdir=$(pwd)

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

# echo
# echo "getting kernel-install-mkinitcpio"
# echo
# echo "Removed"
# echo
# rm -v $workdir/usr/local/bin/kernel-install-mkinitcpio*pkg.tar.zst
# echo
# echo "Copied"
# echo
# cp -v /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/kernel-install-mkinitcpio*pkg.tar.zst $workdir/usr/local/bin
# echo


echo "getting arcolinux-refind-theme-arco-specs"
echo
echo "Removed"
echo
rm -v $workdir/usr/local/bin/arcolinux-refind-theme-arco*pkg.tar.zst
echo
echo "Copied"
echo
cp -v /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/arcolinux-refind-theme-arco-specs*pkg.tar.zst $workdir/usr/local/bin
echo


echo
echo "getting arcolinux-bootloader-refind"
echo
echo "Removed"
echo
rm -v $workdir/usr/local/bin/arcolinux-bootloader-refind*pkg.tar.zst
echo
echo "Copied"
echo
cp -v /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/arcolinux-bootloader-refind*pkg.tar.zst $workdir/usr/local/bin
echo


echo
echo "getting arcolinux-bootloader-systemd-boot"
echo
echo "Removed"
echo
rm -v $workdir/usr/local/bin/arcolinux-bootloader-systemd-boot*pkg.tar.zst
echo
echo "Copied"
echo
cp -v /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/arcolinux-bootloader-systemd-boot*pkg.tar.zst $workdir/usr/local/bin
echo


echo
echo "getting pacman-hook-kernel-install"
echo
echo "Removed"
echo
rm -v $workdir/usr/local/bin/pacman-hook-kernel-install*pkg.tar.zst
echo
echo "Copied"
echo
cp -v /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/pacman-hook-kernel-install*pkg.tar.zst $workdir/usr/local/bin
echo

# Below command will backup everything inside the project folder
git add --all .

#echo "getting latest /etc/pacman.d/gnupg/gpg.conf"
#wget https://raw.githubusercontent.com/arcolinux/arcolinux-system-config/master/etc/pacman.d/gnupg/gpg.conf -O $workdir//usr/local/share/arcolinux/installation/gpg.conf

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

if grep -q main .git/config; then
	echo "Using main"
		git push -u origin main
fi

if grep -q master .git/config; then
	echo "Using master"
		git push -u origin master
fi

echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
