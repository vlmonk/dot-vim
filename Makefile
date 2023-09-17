CURRENT=$(shell pwd)
TARGET=${HOME}/.config/nvim

install:
	mkdir -p ${TARGET}
	rm -rf ${TARGET}
	ln -fs ${CURRENT} ${TARGET}
