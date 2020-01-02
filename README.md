# Compilacin de bitcoinsv en Ubuntu 18
Hay otras fuentes sobre como compilar el código fuente de Bitcoin SV (BSV). Por ejemplo, la oficial: https://github.com/bitcoin-sv/bitcoin-sv/blob/master/doc/build-unix.md

## Notas

Recomendable no menos de 2GB y 2 cores. Sobre estas cantidades subid al doble si se puede. En disco vamos a necesitar unos 5 GB para los productos de la compilacin, configuracin, etc..


## Script de instalacin 

sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

git clone https://github.com/bitcoin-sv/bitcoin-sv.git
cd bitcoin-sv

sudo apt -y install autoconf
sudo apt -y install gcc make libtool pkg-config

./autogen.sh # para generar el ./configure

sudo apt -y install g++ libevent-dev libssl-dev libdb-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libtool libboost-thread-dev libboost-test-dev libboost-program-options-dev libdb++-dev libzmq3-dev # para ubuntu 18

./configure
make
