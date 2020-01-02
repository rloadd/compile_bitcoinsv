# Compilación de Bitcoin SV en Ubuntu 18

Es un tutorial muy directo sobre cmo compilar el código fuente del nodo de Bitcoin SV (BSV). Si quieres buscar errores, depurar, entender qu hace cada cosa, etc.. lo mejor es tener claro como compilar tras editar el código. Aquí te dejo mis notas.

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

## Instalación 
Para finalizar el proceso puedes instalar las aplicaciones compiladas para que estén accesibles by default. No es necesario si lo que quieres es modificar o depurar, pero lo puedes hacer desde el directorio ```bitcoin-sv```:

 ```
 make install
 ```

```console
./src/bitcoind -testnet -printtoconsole
2020-01-02 12:10:21 [bitcoin-main] 
2020-01-02 12:10:21 [bitcoin-main] Bitcoin SV version v0.2.2.0-ba8915504-dev
2020-01-02 12:10:21 [bitcoin-main] InitParameterInteraction: parameter interaction: -whitelistforcerelay=1 -> setting -whitelistrelay=1
2020-01-02 12:10:21 [bitcoin-main] Assuming ancestors of block 0000000000327972b8470c11755adf8f4319796bafae01f5a6650490b98a17db have valid signatures.
[...]
```

Lo recomendable es crear un fichero de configuración con las opciones que nos interesan y usar el parámetro ```-conf=<file>``` para lanzar el servicio.

Otros ejecutables que vamos a encontrar son: ```bitcoin-cli, bitcoin-miner, bitcoin-seeder y bitcoin-tx```.




