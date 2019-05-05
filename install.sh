#!bin/sh

sudo apt update -y
sudo apt install -y cmake curl gcc g++ htop make ninja-build python3-pip tmux vim wget xclip zsh

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

ln -nfs $HOME/dotfiles/zshrc $HOME/.zshrc
ln -nfs $HOME/dotfiles/adam1.zsh-theme \
  $HOME/.oh-my-zsh/custom/themes/adam1.zsh-theme
ln -nfs $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
ln -fs $HOME/dotfiles/ideavimrc $HOME/.ideavimrc

sudo apt install -y clang-format clang-tools

curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  > $HOME/Miniconda3-latest-Linux-x86_64.sh
sh $HOME/Miniconda3-latest-Linux-x86_64.sh
rm $HOME/Miniconda3-latest-Linux-x86_64.sh

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update -y
sudo apt install -y neovim

mkdir -p $HOME/.config/nvim
ln -nfs $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
rm ripgrep_0.8.1_amd64.deb

curl https://sh.rustup.rs -sSf | sh

sudo apt install fonts-powerline

chsh -s $(which zsh)
