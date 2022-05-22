
# Haroldcoin-Node 

This is a dockerized full node for Haroldcoin. The intent for this project is to make running a full node more accessible for people to use for a masternode and / or contribute to the network. 



## Run Locally

Clone the project

```bash
  git clone git@github.com:Daedalus-/Haroldcoin-Node.git
```

Go to the project directory

```bash
  cd Haroldcoin-Node
```

You now need to make a data directory where the node will save its config file as well as all of the blockchain, NFT data, etc. (Make sure it has enough space.)

```bash
  mkdir /data/haroldcoin
```

Copy and configure the `haroldcoin.conf` to the data directory.

```bash
  cp haroldcoin.conf.example /data/haroldcoin/haroldcoin.conf

```

DO NOT FORGET TO EDIT THE FILE WITH A NEW PASSWORD

```bash
  vim /data/haroldcoin/haroldcoin.conf
```

Edit the `docker-compose.conf` to set your desired data directory under `volumes:`.

```bash
    volumes:
      - /data/haroldcoin/:/root/.haroldcoin/
```

Build the image - Ensure you have the latest `docker compose` installed from `https://github.com/docker/compose`. During the build this will check out the latest `haroldcoin` source and compile it.

```bash
  docker compose build
```

All that is left is to start the node!

```bash
  docker compose up -d
```

To check that the container is running, use the `docker ps` command. 

```bash
  CONTAINER ID   IMAGE                                  COMMAND            CREATED             STATUS             PORTS                                                               NAMES
  5a0e1fa0b61a   harold-node:v1.0                       "haroldcoind"      4 minutes ago       Up 17 seconds      0.0.0.0:25674->25674/tcp, 6432-6433/tcp, 0.0.0.0:25676->25676/tcp   harold-node
```

Take a look in your data directory and make sure files are being created there.

```bash
  ls -la /data/haroldcoin
```

You can also watch the `debug.log` to see the live output. (CTRL+C to stop)

```bash
  tail -f /data/haroldcoin/debug.log
```

If you wish to stop the node you can use the following command:

```bash
  docker compose down
```
