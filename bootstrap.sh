#!/usr/bin/env bash
system=$(uname)

if [ $system == "Darwin" ]; then
    echo "installing for OSX"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install zsh
    brew install tmux
elif [ $system == "Linux" ]; then
    sudo apt-get install zsh
    sudo apt-get install tmux
else
	echo "System not supported!"
fi

# install zshell
chsh -s /bin/zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# install vim config
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

# install shell plugins
mkdir ~/.shellplugins
curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.shellplugins/z.sh
curl https://raw.githubusercontent.com/rupa/z/master/z.1 > /usr/local/share/man/man1/z.1

# download cheat sheets
mkdir ~/.cheatsheets
curl https://gist.githubusercontent.com/MohamedAlaa/2961058/raw/b209816bf94f9de56b8eebf986f06cfc5df4dbf7/tmux-cheatsheet.markdown > ~/.cheatsheets/tmux.cheat

# customize .zshrc
echo ". ~/.shellplugins/z.sh" >> ~/.zshrc
echo "set -o 'vi'" >> ~/.zshrc

# install v
curl https://raw.githubusercontent.com/rupa/v/master/v > usr/local/bin/v
sudo chmod 755 usr/local/bin/v
curl https://raw.githubusercontent.com/rupa/v/master/v.1 > /usr/local/share/man/man1/v.1


# update man pages
sudo mandb
