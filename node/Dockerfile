FROM ubuntu:bionic AS build

WORKDIR /haroldcoin

RUN apt-get update -y && \
    apt install -y software-properties-common && \
    add-apt-repository -y ppa:bitcoin/bitcoin && \
    apt-get update -y && \
    apt-get install -y git build-essential libtool autotools-dev autoconf pkg-config automake \
        libevent-dev libboost-all-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libssl1.0-dev bsdmainutils zip  && \
    apt-get install -y libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libdb++-dev && \
    apt-get install -y git 

RUN git clone https://github.com/Harold-Coin/haroldcoin-main-23-may.git /haroldcoin/harold-core

WORKDIR /haroldcoin/harold-core 

RUN chmod +x autogen.sh && \
    chmod +x share/genbuild.sh && \
    chmod +x src/leveldb/build_detect_platform

RUN ./autogen.sh 
RUN ./configure --with-incompatible-bdb 
#RUN ./configure 

# The makefile fails, but the binaries we need get built
#RUN make || true 
RUN make 
RUN make install

FROM ubuntu:bionic AS production

EXPOSE 6432 6433

RUN apt-get update -y && \
  apt install -y software-properties-common && \
  add-apt-repository -y ppa:bitcoin/bitcoin && \
  apt-get update -y && \
  apt-get install -y git libevent-dev libboost-all-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libssl1.0-dev bsdmainutils zip  && \
  #libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libdb++-dev && \
  apt-get autoremove -y && \
  apt-get clean && rm -rf /var/lib/apt/lists/* 

WORKDIR /haroldcoin
COPY --from=build /usr/local/bin/haroldcoind /usr/local/bin/haroldcoind
COPY --from=build /usr/local/bin/haroldcoin-cli /usr/local/bin/haroldcoin-cli
COPY --from=build /usr/local/bin/haroldcoin-tx /usr/local/bin/haroldcoin-tx
COPY --from=build /usr/local/bin/test_haroldcoin /usr/local/bin/test_haroldcoin

RUN apt-get clean && rm -rf /var/lib/apt/lists/* 

COPY get-info.sh /bin/ 
	
	
CMD ["haroldcoind"]
