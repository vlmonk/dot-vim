CURRENT=$(shell pwd)
TARGET=${HOME}/.config/nvim

install:
	mkdir -p ${TARGET}
	ln -sf ${CURRENT}/init.vim ${TARGET}/init.vim
	ln -sf ${CURRENT}/ftplugin ${TARGET}/ftplugin
