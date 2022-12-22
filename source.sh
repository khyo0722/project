##thmcoin base by bitcoin

#qt install common
apt-get install -y x11-apps xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic

#qt in naver cloud flatform
apt-get install -y ubuntu-desktop xorg xrdp xserver-xorg mesa-utils xauth gdm3
dpkg-reconfigure xserver-xorg

#
​apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler qt5-default

apt-get install -y libboost-all-dev 
apt-get install -y libboost-system-dev 
apt-get install -y libboost-filesystem-dev 
apt-get install -y libboost-chrono-dev 
apt-get install -y libboost-program-options-dev 
apt-get install -y libboost-test-dev 
apt-get install -y libboost-thread-dev

apt-get install -y openssl libssl-dev

systemd-machine-id-setup
dbus-uuidgen --ensure
cat /etc/machine-id
apt-get install x11-apps xfonts-base xfonts-100dpi xfonts-75dpi xfonts-cyrillic

vim ~/.bashrc
export DISPLAY=:0
source ~/.bashrc
xeyes

wget https://boostorg.jfrog.io/artifactory/main/release/1.64.0/source/boost_1_64_0.tar.bz2
./bootstrap.sh
./b2
ln -s /root/coin/boost_1_64_0/stage/lib/* /usr/lib

wget wget http://archive.ubuntu.com/ubuntu/pool/main/libe/libevent/libevent-pthreads-2.1-7_2.1.11-stable-1_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/libe/libevent/libevent-core-2.1-7_2.1.11-stable-1_amd64.deb
wget http://ports.ubuntu.com/pool/main/libe/libevent/libevent-2.1-7_2.1.11-stable-1_arm64.deb
wget https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz

./configure
make
make install
cp /usr/local/lib/libevent-2.1.so.7 /usr/lib

wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xvf db-4.8.30.NC.tar.gz
sed -i 's/__atomic_compare_exchange/__atomic_compare_exchange_db/g' db-4.8.30.NC/dbinc/atomic.h
cd db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx
make -j 8
sudo make install

sudo ln -s /usr/local/BerkeleyDB.4.8 /usr/include/db4.8 
sudo ln -s /usr/include/db4.8/include/* /usr/include 
sudo ln -s /usr/include/db4.8/lib/* /usr/lib

mkdir workspace
cd workspace

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt install g++-7 -y
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7

git clone -b 0.15.2 https://github.com/bitcoin/bitcoin.git thmcoin && cd thmcoin
rm -rf .git

find . -exec rename 's/readercoin/thm/' {} ";"
find . -exec rename 's/rdc/thm/' {} ";"

find ./ -type f -readable -writable -exec sed -i "s/Readercoin/THM/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/ReaderCoin/Thm/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/readercoin/thm/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/ReaderCoin/Thm/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/Readercoind/Thmd/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/readercoind/thmd/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/READERCOIN/THM/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/rdc/thm/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/RDC/THM/g" {} \;

find ./ -type f -readable -writable -exec sed -i "s/8332/9332/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/8333/9333/g" {} \;

vim src/chainparams.cpp

cd ..
git clone https://github.com/lhartikk/GenesisH0
cd GenesisH0

# mainNet
python2 genesis.py -z "25/jan/2022 on a cold and grey winter afternoon" -n 1 -t 1643034759 -v 1000000000 -b 0x1e0ffff0

root@theheim:~/coin/workspace/GenesisH0# python2 genesis.py -z "25/jan/2022 on a cold and grey winter afternoon" -n 1 -t 1643034759 -v 1000000000 -b 0x1e0ffff0
04ffff001d01042f32352f6a616e2f32303232206f6e206120636f6c6420616e6420677265792077696e7465722061667465726e6f6f6e
algorithm: SHA256
merkle hash: ecdc3d7926ae52e39caec5aa22a742848b65dc4fc8256140b5872eed20c1d8b0
pszTimestamp: 25/jan/2022 on a cold and grey winter afternoon
pubkey: 04678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5f
time: 1643034759
bits: 0x1e0ffff0
Searching for genesis hash..
genesis hash found!
nonce: 282901
genesis hash: 000004884d309920364e1ffbe9c80d5dbe9dcda0ac735891c89fe6d1e9745274

vim src/chainparams.cpp
#1231006505, 2083236893, 0x1d00ffff, 1, 50 * COIN
#0x000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f
#0x4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b

# testNet
python2 genesis.py -z "25/jan/2022 on a cold and grey winter afternoon" -n 282901 -t 1643109126 -v 1000000000 -b 0x1e0ffff0
merkle hash: ecdc3d7926ae52e39caec5aa22a742848b65dc4fc8256140b5872eed20c1d8b0
nonce: 451689
genesis hash: 00000122c8a0813caccafd643620773b5c52ea82d46e1c695794e24bbd37240d
pubkey: 04678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5f

# regNet
python2 genesis.py -z "25/jan/2022 on a cold and grey winter afternoon" -n 451689 -t 1598918400 -v 1000000000 -b 0x1e0377ae
merkle hash: ecdc3d7926ae52e39caec5aa22a742848b65dc4fc8256140b5872eed20c1d8b0
nonce: 727834
genesis hash: 0000034f7a61e4a416aa1b8933f4d93eaf046fb9230d805d0341c3e8131a33c0
pubkey: 04678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5f

# regNetParams
python2 genesis.py -z "25/jan/2022 on a cold and grey winter afternoon" -n 7 -t 1296688602 -v 1000000000 -b 0x207fffff
merkle hash: ecdc3d7926ae52e39caec5aa22a742848b65dc4fc8256140b5872eed20c1d8b0
nonce: 10
genesis hash: 723f477c7d4e2c6422fc7c39ebb015e5f6159d7bce3cfaf5ed39a694d69e62ce
pubkey: 04678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5f


#compile
cd ~/coin/thm
chmod 755 -R ~/coin/thm/share
bash autogen.sh
#CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site
./configure --with-gui=qt5 --enable-debug --disable-tests --prefix=/
#strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
make -j 8
make install DESTDIR=/root/coin/thm/

# vim ~/.thm/thm.conf
server=1
rpcuser=theheim
rpcpassword=dws400@@
rpcallowip=0.0.0.0/0



#test
~/coin/thm/bin/thmd -rpcuser=theheim -rpcpassword=dws400@@
~/coin/thm/bin/thm-cli -rpcuser=theheim -rpcpassword=dws400@@ getblockchaininfo

# connection (in add-node1)
# 네이버클라우드 서버의 경우 ACG설정 해야함 : 0.0.0.0/0 9333
ping 118.67.134.167
~/coin/thm/bin/thm-cli addnode 118.67.134.167:9333 onetry

bitcoin-cli -regtest getnewaddress theheim

#scp -P 1024 /root/coin/thm.tar.gz root@27.96.129.99:/root/

#wget https://boostorg.jfrog.io/artifactory/main/release/1.64.0/source/boost_1_64_0.tar.bz2
#./bootstrap.sh
#./b2
# connection (in genesis-node2)
ping 101.101.216.196
#~/coin/thm/bin/thm-cli addnode 218.54.107.82:9333 onetry
~/coin/thm/bin/thm-cli addnode 211.187.241.162:9333 onetry
~/coin/thm/bin/thm-cli addnode 101.101.218.7:9333 onetry

tail -n 10 ~/.thm/debug.log
~/coin/thm/bin/thm-cli getblockchaininfo
~/coin/thm/bin/thm-cli getconnectioncount 
~/coin/thm/bin/thm-cli getblockcount 

# mining
~/coin/thm/bin/thm-cli getnewaddress theheim
16vg3LTc3HTDh8TSeEj6mmouy3o8Z2Abgk

#~/coin/thm/bin/thm-cli getaddressesbyaccount theheim
 


git clone https://github.com/bitzeny/cpuminer.git cpuminer
cd cpuminer
sudo apt-get install apt-file
sudo apt-file update
apt-file search aclocal
apt-get install automake
./configure CFLAGS="-O3 -march=native -funroll-loops -fomit-frame-pointer"
make -j 8

git clone https://github.com/JayDDee/cpuminer-opt.git cpuminer-opt
cd cpuminer-opt/
./autogen.sh
CFLAGS="-O3 -march=native -Wall"
./configure --with-curl
apt-get install libgmp3-dev
make -j 8

~/coin/thm/bin/thm-qt
~/coin/thm/bin/thm-cli generate 101
# 100개 이상의 블록이 생성된 후 채굴이 가능함 (그 이전에 채굴하려하면 bad-cp-height 에러)

./cpuminer -a sha256d -o http://127.0.0.1:9332 -u theheim -p dws400@@ --no-stratum --no-longpoll --no-getwork -t 2 --coinbase-addr=16vg3LTc3HTDh8TSeEj6mmouy3o8Z2Abgk


# ssh theheim@211.187.241.162 -p 1024

############################
git clone -b 0.15 --single-branch https://github.com/litecoin-project/litecoin.git thmcoin_0.0.15
cd thmcoin_0.0.15/

find ./ -type f -readable -writable -exec sed -i "s/Litecoin/THMcoin/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LiteCoin/ThmCoin/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/litecoin/thmcoin/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/Litecoind/THMcoind/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/LITECOIN/THMCOIN/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/lites/thms/g" {} \;

find ./ -type f -readable -writable -exec sed -i "s/LTC/THM/g" {} \;
find ./ -type f -readable -writable -exec sed -i "s/photons/tphotons/g" {} \;


2ebcfe2dd9eff82666
000000000000000000
7d006a402163e
0000000000000