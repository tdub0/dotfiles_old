#!/bin/bash

remoteURL=git@github.com:tdub0/dotfiles.git

cd ~/
git clone --bare $remoteURL $HOME/.dotfiles
function dot {
   git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
}
dot checkout
if [ $? = 0 ]; then
   echo "checkout out dotfiles."
else
	echo "Backing up pre-existing dot files."
	mkdir -p .dotfile-backup/.bashrc.d
	mkdir -p .dotfile-backup/.prefs
	mkdir -p .dotfile-backup/.vim/{autoload,bundle,pack,colors,doc,plugin}
	dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfile-backup/{}
fi
dot checkout
dot config status.showUntrackedFiles no
