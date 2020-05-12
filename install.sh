#!bin/sh

sudo apt update -y
sudo apt install -y cmake curl gcc g++ htop make ninja-build python3-pip tmux vim wget xclip zsh

git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

ln -nfs $HOME/dotfiles/vimrc $HOME/.vimrc
ln -nfs $HOME/dotfiles/zshrc $HOME/.zshrc
ln -nfs $HOME/dotfiles/adam1.zsh-theme \
  $HOME/.oh-my-zsh/custom/themes/adam1.zsh-theme
ln -nfs $HOME/dotfiles/tmux.conf $HOME/.tmux.conf

sudo apt install -y clang-format clang-tools

ln -fs $HOME/dotfiles/clang-format $HOME/.clang-format

curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  > $HOME/Miniconda3-latest-Linux-x86_64.sh
sh $HOME/Miniconda3-latest-Linux-x86_64.sh
rm $HOME/Miniconda3-latest-Linux-x86_64.sh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
rm ripgrep_0.8.1_amd64.deb

chsh -s $(which zsh)
