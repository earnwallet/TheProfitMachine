#!/bin/bash
echo "checking if dogecoin core is installed";
start=`date +%s`;
timeout 2 dogecoind;
end=`date +%s`
tim=`expr $end - $start`

if [ $tim -gt 1 -o $? ]; then
    echo "Dogecoin core is installed";
else
    echo "Not enough doge, need to make more";

echo "Step 0. Install software.";
sudo apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y;
cd ~

user=$(whoami)
pass=$(echo -n $user | sha512sum | cut -c1-61)
config_path="/home/$user/.dogecoin"
mkdir $config_path
file_path="$config_path/dogecoin.conf";
rm $file_path;
echo "rpcuser=$user" >> $file_path
echo "rpcpassword=$pass" >> $file_path
echo "rpcport=1337" >> $file_path
echo "rpcallowip=127.0.0.1" >> $file_path
echo "txindex=0" >> $file_path
echo "prune=2200" >> $file_path
echo "server=1" >> $file_path
echo "deamon=1" >> $file_path
echo "maxconnections=8" >> $file_path
echo "par=0" >> $file_path
echo "CONFIGURED";


pwd=$(pwd)
git clone https://github.com/dogecoin/dogecoin
cd ~/dogecoin
BITCOIN_ROOT="$pwd/dogecoin"
# Pick some path to install BDB to, here we create a directory within the dogecoin directory
BDB_PREFIX="${BITCOIN_ROOT}/db5"
mkdir -p $BDB_PREFIX
# Fetch the source and verify that it is not tampered with

cp $pwd/TPM/install/bdb.tar.gz $BDB_PREFIX/bdb.tar.gz
cd $BDB_PREFIX
# -> db-5.1.29.NC.tar.gz: OK
tar -xzvf bdb.tar.gz -C $BITCOIN_ROOT
# Build the library and install to our prefix
cd $BITCOIN_ROOT/db-5.1.29.NC/build_unix/
#  Note: Do a static build so that it can be embedded into the executable, instead of having to find a .so at runtime
../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$BDB_PREFIX --build=x86_64 #Replace with your build if needed. 
make install
# Configure Dogecoin Core to use our own-built instance of BDB
cd $BITCOIN_ROOT
./autogen.sh
./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/" # (other args...)
make
make install
fi
