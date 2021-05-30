CURRENT=$(shell pwd)
TARGET=${HOME}/.config/nvim

install:
	rm -rf ${TARGET}
	ln -fs ${CURRENT} ${TARGET}
