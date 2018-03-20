#################################################################################
# Set up various bin directories on the PATH

if [ -e "$HOME/go/bin/" ]; then
	PATH="$HOME/go/bin/":$PATH
fi

if [ -e "$HOME/jdk1.8.0_162/bin/" ]; then
	PATH="$HOME/jdk1.8.0_162/bin/":$PATH
fi

export PATH

#################################################################################
# Set up aliases

alias ll='ls -la'
