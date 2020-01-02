# Compilación de bitcoinsv en Ubuntu 18
Es recomendable visitar la fuente oficial para compilar código fuente de Bitcoin SV (BSV): https://github.com/bitcoin-sv/bitcoin-sv/blob/master/doc/build-unix.md

## Notas

Recomendable no menos de 2GB de RAM y 2 cores. Sobre estas cantidades subid al doble si se puede porque lo vamos a ganar en acortar la duración del proceso. Independientemente de lo que ocupan los paquetes que vamos a instalar, necesitamos unos 2GB de disco para los productos de la compilación, configuración, etc..


## Script de instalación 


```console
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
```


## Resultado
En la carpeta ```src``` tenemos los ejecutables. Por ejemplo, ejecutamos 



```console
./src/bitcoind --help
```
