#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function updateDotFiles() {
    rsync --exclude "bootstrap.sh" --exclude ".git" -avh --no-perms . ~;
    source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    updateDotFiles;
else
    read -p "This update will overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        updateDotFiles;
    fi;
fi;
unset updateDotFiles;
