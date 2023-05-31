

wget https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz

tar -xvf node-v18.16.0-linux-x64.tar.xz

mkdir ~/usr/

mv node-v18.16.0-linux-x64/* ~/usr/

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

