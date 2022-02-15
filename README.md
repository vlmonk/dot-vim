### setup instruction

install deps:

```
brew install nvim
brew install the_silver_searcher
```

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
make install
```

### install ubuntu

```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
```

### ubuntu 18.04 support

as root: 

```
sudo add-apt-repository ppa:deadsnakes/ppa
apt install python3.9 python3.9-venv
```

as user

```
python3.9 -m venv ~/python3.9
source ~/python3.9/bin/activate
pip install neovim
```

and add `source ~/python3.9/bin/activate` to shell init files

