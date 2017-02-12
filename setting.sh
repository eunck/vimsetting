#!/bin/sh 

echo "> download vundle"
if [ -d "$PWD/.vim/bundle/vundle" ]; then
	echo "> skip"
else
	git clone https://github.com/VundleVim/Vundle.vim.git $PWD/.vim/bundle/Vundle.vim
fi

echo "> Link .vimrc"
if [ -h "$HOME/.vimrc" ]; then
	echo "> .vimrc(symbolic link) already exist. It will remove."
	rm $HOME/.vimrc
elif [ -f "$HOME/.vimrc" ]; then
	echo "> .vimrc already exist"
	echo "> change .vimrc to .vimrc.bak"
	mv $HOME/.vimrc $HOME/.vimrc.bak
fi
ln -s $PWD/.vimrc $HOME/.vimrc

echo "> Link .vim"
if [ -d "$HOME/.vim" ]; then
	echo "> .vim already exist"
	echo "> change .vim to .vim.bak"
	mv $HOME/.vim $HOME/.vim.bak
fi
ln -s $PWD/.vim $HOME/.vim

echo "> Install Plugins" 
vim +PluginInstall +qall
