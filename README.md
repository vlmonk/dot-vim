### setup insruction

install vim-plug:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

install packages
```
npm install -g neovim
pip3 install --user pynvim
```

link config:
```
ln -sf $(pwd)/init.vim ~/.config/nvim/init.vim
```
