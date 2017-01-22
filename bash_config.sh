#!/bin/bash
command_exists () {
    type "$1" &> /dev/null ;
}

if [ "$(whoami)" != "root" ]; then
	echo 'Uruchom z prawami administratora'
	exit 1
fi

if command_exists toilet ; then
	echo 'Toilet zainstalowany'
else
	echo 'Toilet niezainstalowany'
	apt-get install toilet;
fi

if command_exists lolcat ; then
	echo 'Locat zainstalowany'
else
	echo 'Lolcat niezainstalowany'
        apt-get install lolcat;
fi

if command_exists boxes ; then
        echo 'Boxes zainstalowany'
else
        echo 'Boxes niezainstalowany'
        apt-get install boxes;
fi

if [ ! -f /usr/share/figlet/ivrit.flf ]; then
	echo "Nieznaleziono czcionki ivrit"
	wget "http://www.figlet.org/fonts/ivrit.flf" -P /usr/share/figlet
fi

echo "toilet -f ivrit 'KARDAN' | boxes -d cat -a hc -p h8 | lolcat" >> .bashrc
echo -e 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\\033[01;32m\\]\u@\\h\\[\\033[00m\\]:\[\\033[01;34m\\]\w\\[\\033[01;33m\\\]\$(__git_ps1)\[\\033[00m\]\\$"' >> .bashrc

