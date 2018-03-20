# termux-config
This is the current state of my termux setup for development on ChromeOS/Android. Can be used to get a full blown dev env after installing Termux and Termux:API.

To install, either download a release or clone the repo after installing git.

If `./install` ist not executable, make it so:

```
chmod +x install
```

Then go ahead and run it:

```
./install
```

This will
* update the repo data
* download all the pakages in `termux_packages`
* install all the npm packages in `npm_packages` globally
* install all the pip packages in `pip_packages`
* create an ssh key pair for github
* create a basic ssh config to use that key pair
* link a basic `.bash_profile` into place

