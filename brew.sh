#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install in one command as much as possible
brew install \
	ack \
	aircrack-ng \
	bfg \
	binutils \
	binwalk \
	cifer \
	clang-format \
	cloc \
	coreutils \
	cppcheck \
	crystal-lang \
	ctags \
	dex2jar \
	dns2tcp \
	fcrackzip \
	fd \
	findutils \
	flawfinder \
	foremost \
	git \
	git-lfs \
	gnupg \
	grep \
	hashpump \
	hydra \
	john \
	knock \
	libidn \
	libmagic \
	lua \
	lynx \
	moreutils \
	neovim \
	netpbm \
	nmap \
	openssh \
	p7zip \
	pigz \
	pngcheck \
	postgresql \
	pv \
	pyenv \
	rbenv \
	rename \
	rethinkdb \
	rlwrap \
	sbt \
	screen \
	socat \
	sqlmap \
	ssh-copy-id \
	streamlink \
	tcpflow \
	tcpreplay \
	tcptrace \
	tmux \
	tree \
	ucspi-tcp \
	vbindiff \
	xpdf \
	xz \
	zopfli \
	zsh-syntax-highlighting \


brew install gnu-sed --with-default-names
brew install wget --with-iri
brew install vim --with-override-system-vi
brew install homebrew/php/php56 --with-gmp
brew install imagemagick --with-webp
brew install yarn --without-node

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Remove outdated versions from the cellar.
brew cleanup
