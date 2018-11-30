#!bin/sh

sudo apt update -y
sudo apt install -y curl htop tmux vim wget zsh

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

ln -nfs $HOME/dotfiles/zshrc $HOME/.zshrc
ln -nfs $HOME/dotfiles/aia1.zsh-theme \
  $HOME/.oh-my-zsh/custom/themes/aia1.zsh-theme

ln -nfs $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

sudo apt install -y clang-format clang-tools

curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  > $HOME/Miniconda3-latest-Linux-x86_64.sh
sh $HOME/Miniconda3-latest-Linux-x86_64.sh
rm $HOME/Miniconda3-latest-Linux-x86_64.sh

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update -y
sudo apt install -y neovim
pip install pynvim
pip install --upgrade pynvim

mkdir -p $HOME/.config/nvim
ln -nfs $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
rm ripgrep_0.8.1_amd64.deb

chsh -s $(which zsh)
