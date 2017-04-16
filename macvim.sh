echo "alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim \"\$@\"'" >> ~/.bash_profile
echo "alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim \"\$@\"'" >> ~/.bash_profile
exec $SHELL -l
