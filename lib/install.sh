#!/bin/bash
# This script installs developer stuff on OS X.



# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


brew install \
	git \
	hub \
	tree \
	nvm \
	gpg \

if [ $(cat /private/etc/shells | grep $(which fish) | wc -l) -eq 0 ]; then
	sudo bash -c "echo $(which fish) >> /private/etc/shells"
fi


npm install -g \
	dependency-check


brew install caskroom/cask/brew-cask
brew cask install \
	firefox \
	transmission \
	vlc \
	disk-inventory-x \



brew cask install \
	qlmarkdown \
	qlstephen \
	qlcolorcode \

qlmanage -r
qlmanage -r cache



# external=( \
# 	'/Volumes/Medien/Software/Programme/Marked 2/marked.app.zip' \
# 	'/Volumes/Medien/Software/Programme/Moom/moom.app.zip' \
# 	'/Volumes/Medien/Software/Programme/Flick/flick.app.zip' \
# 	'/Volumes/Medien/Software/Programme/iA Writer/ia-writer.app.zip' \
# 	'/Volumes/Medien/Software/Programme/Dash/dash.app.zip' \
# 	'/Volumes/Medien/Software/Programme/Sketch/sketch.app.zip' \
# 	'/Volumes/Medien/Software/Programme/LanScan/lanscan.app.zip' \
# 	'/Volumes/Medien/Software/Programme/Sublime Text/sublime-text.app.zip' \
# 	'/Volumes/Medien/Software/Programme/Telephone/telephone.app.zip'
# )
# for app in "${external[@]}"; do
# 	unzip -nq "$app" -d ./test
# done

# ln -s /System/Library/CoreServices/Applications/Screen\ Sharing.app /Applications/Screen\ Sharing.app

brew cleanup
brew cask cleanup
npm cache -g clean