#!bin/sh

sudo apt update -y
sudo apt install -y curl htop python3-pip tmux vim wget zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -nfs $HOME/dotfiles/zshrc $HOME/.zshrc
ln -nfs $HOME/dotfiles/aia1.zsh-theme \
  $HOME/.oh-my-zsh/custom/themes/aia1.zsh-theme

chsh -s $(which zsh)

ln -nfs $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

sudo apt install -y clang-format

curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  > $HOME/Miniconda3-latest-Linux-x86_64.sh
sh $HOME/Miniconda3-latest-Linux-x86_64.sh

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
pip3 install neovim
pip3 install --upgrade neovim

mkdir -p $HOME/.config/nvim
ln -nfs $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
