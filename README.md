# Compilación de Bitcoin SV en Ubuntu 18

Es un tutorial muy escueto sobre cómo compilar el código fuente del nodo de Bitcoin SV (BSV). Si quieres buscar errores, depurar, entender qué hace cada cosa, etc.. lo mejor es tener un entorno de compilación al que acudor tras editar el código. Aquí te dejo mis notas.

Es recomendable visitar la fuente oficial para compilar código fuente de Bitcoin SV (BSV): https://github.com/bitcoin-sv/bitcoin-sv/blob/master/doc/build-unix.md

## Notas

Recomendable no menos de 2GB de RAM y 2 cores. Con el doble de recursos acortamos la duración del proceso bastante. Independientemente de lo que ocupan los paquetes que vamos a instalar, necesitamos unos 2GB de disco para los productos de la compilación, configuración, etc..


## Script de compilación 


```
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
En la carpeta ```src``` tenemos los ejecutables. Por ejemplo, ejecutamos :


```
./src/bitcoind -testnet -printtoconsole
2020-01-02 12:10:21 [bitcoin-main] 
2020-01-02 12:10:21 [bitcoin-main] Bitcoin SV version v0.2.2.0-ba8915504-dev
2020-01-02 12:10:21 [bitcoin-main] InitParameterInteraction: parameter interaction: -whitelistforcerelay=1 -> setting -whitelistrelay=1
2020-01-02 12:10:21 [bitcoin-main] Assuming ancestors of block 0000000000327972b8470c11755adf8f4319796bafae01f5a6650490b98a17db have valid signatures.
[...]
```

Lo recomendable es crear un fichero de configuración con las opciones que nos interesan y usar el parámetro ```-conf=<file>``` para lanzar el servicio.

Otros ejecutables que vamos a encontrar son: ```bitcoin-cli, bitcoin-miner, bitcoin-seeder y bitcoin-tx```.



## Instalación 
Para finalizar el proceso puedes instalar las aplicaciones compiladas para que estén accesibles by default. No es necesario si lo que quieres es modificar o depurar, pero lo puedes hacer desde el directorio ```bitcoin-sv```:

 ```
 make install
 ```
 
 ## Sobre las versiones de código y genesis
 
 En https://github.com/bitcoin-sv/bitcoin-sv/releases encontramos todas las releases de código. Las instrucciones de este doc funcionan con todas ellas hasta la 1.0.0 inclusive. A la derecha de la release, tienes enlaces que te llevan al explorador del repositorio.
 
  + "Stable" Genesis, https://github.com/bitcoin-sv/bitcoin-sv/tree/v1.0.0
  + "Stable" pre-genesis, https://github.com/bitcoin-sv/bitcoin-sv/tree/v0.2.1
 
 Esto aplica a la receta de compilación de arriba en la medida en la que si quieres compilar una de estas dos especificamente debes emplear el concepto de release. Empleando el genérico, apuntas a la rama master en la versión más reciente que era una y será otra.
 
```
 $ git tag -l  
v0.1.0
v0.1.1
v0.2.0
v0.2.1
v0.2.2.beta
v1.0.0
v1.0.0.beta1
v1.0.0.beta2
```

Decidimos que queremos compilar la versión pre-genesis v0.2.1:

```
$ git checkout tags/v0.2.1
Note: checking out 'tags/v0.2.1'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD se encuentra en f5503f0... Merge commit '21506c72a79870d61f2b866c317704b4c6b0ebf6' into Orinoco
```

Comprobamos que estamos en esa release:

```
$ git branch -v
* (HEAD detached at v0.2.1) f5503f0 Merge commit '21506c72a79870d61f2b866c317704b4c6b0ebf6' into Orinoco
  master 7fd177c Fix Genesis post-merge compile error.
```

Podemos volver a la release v1.0.0 o a la última versión de la rama master para obtener que inicialmente hemos clonado:

```
$ git checkout tags/v1.0.0
Previous HEAD position was f5503f0... Merge commit '21506c72a79870d61f2b866c317704b4c6b0ebf6' into Orinoco
HEAD se encuentra en 7fd177c... Fix Genesis post-merge compile error.
$ git branch -v
* (HEAD detached at v1.0.0) 7fd177c Fix Genesis post-merge compile error.
  master 7fd177c Fix Genesis post-merge compile error.
 ``` 

A partir de aquí la receta continua a partir de ```cd bitcoin-sv``` con normalidad.
 
 
 ## Recuerda que...
 
+ Por defecto el directorio donde descarga los bloques será $HOME/.bitcoin



