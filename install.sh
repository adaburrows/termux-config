#!/data/data/com.termux/files/usr/bin/bash

echo "
Updating repos...
"
apt update

echo "

Installing termux packages...
"
(xargs -0 apt install -y < <(tr \\n \\0 < termux_packages))

if [ ! -e "$PREFIX/bin/virtualenv" ]; then
	echo "

Installing python packages with pip...
"
	pip install -r pip_packages 
fi

if [ ! -e "$HOME/.npm/" ]; then
	echo "

Installing global node modules...
"
	xargs -0 npm install -g < <(tr \\n \\0 < npm_packages)
fi

SSH_CONFIG="$HOME/.ssh/config"
GITHUB_KEY="$HOME/.ssh/github"
SAMPLE_CONFIG=`cat "$(pwd)/githubSshConfig"`

if [ ! -e $GITHUB_KEY ]; then
	echo "

Creating a basic ssh key in $GITHUB_KEY for use with Github...
"
	ssh-keygen -f "$GITHUB_KEY"
	
	if [ -e "$GITHUB_KEY.pub" ]; then
		PUB=$(cat "$GITHUB_KEY.pub")
		termux-clipboard-set $PUB
		echo "

The public key $PUB has been copied to the clipboard for easy adding to Github.
"
	fi

	if [ -e "$SSH_CONFIG" ]; then
		echo "

Make sure the generated key is reference by your $SSH_CONFIG file by inserting lines:

$SAMPLE_CONFIG
"
	fi

	if [ ! -e "$SSH_CONFIG" ]; then
		echo "

Copying over a simple $SSH_CONFIG file. Please modify it to your liking:

$SAMPLE_CONFIG
"
		cp githubSshConfig $SSH_CONFIG
	fi
fi

echo "

When compiling programs from source, make sure that the $PREFIX doesn't get in the way.
Some basic instructions are available at:
  https://wiki.termux.com/wiki/Package_Management
"

BASH_PROFILE="$HOME/.bash_profile"
if [ ! -e $BASH_PROFILE ]; then
	echo "

Linking $BASH_PROFILE.
"
	ln -s "$(pwd)/.bash_profile" $BASH_PROFILE
fi




