sudo apt -y update
sudo apt -y upgrade
sudo apt -y autoremove

git clone https://github.com/bitcoin-sv/bitcoin-sv.git
cd bitcoin-sv

sudo apt -y install autoconf
sudo apt -y install gcc make libtool pkg-config

./autogen.sh # para generar el ./configure

sudo apt -y install g++ libevent-dev libssl-dev libdb-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libtool libboost-thread-dev libboost-test-dev libboost-program-options-dev libdb++-dev libzmq3-dev # para ubuntu 18

./configure  # para generar el Makefile

make

