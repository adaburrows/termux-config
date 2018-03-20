# generate installed package list
dpkg --get-selections | cut -f1 > termux_packages
