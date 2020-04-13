CURRENT=$(shell pwd)
TARGET=${HOME}/.config/nvim

install:
	mkdir -p ${TARGET}
	ln -sfn ${CURRENT}/init.vim ${TARGET}/init.vim
	ln -sfn ${CURRENT}/ftplugin ${TARGET}/ftplugin
	ln -sfn ${CURRENT}/coc-settings.json ${TARGET}/coc-settings.json
