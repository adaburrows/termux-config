#################################################################################
# Set up various bin directories on the PATH

# Put go on the path
if [ -e "$HOME/go/bin/" ]; then
	PATH="$HOME/go/bin/":$PATH
fi

# Putting jdk on the path -- note this doesn't work with termux, but it did with
#   the normal shell under root in dev mode. Will have to do something different.
if [ -e "$HOME/jdk1.8.0_162/bin/" ]; then
	PATH="$HOME/jdk1.8.0_162/bin/":$PATH
fi

export PATH

#################################################################################
# Set up aliases

alias ll='ls -la'
