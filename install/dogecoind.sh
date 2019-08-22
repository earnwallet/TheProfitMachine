#!/bin/sh
echo "Step 0. Install software.";
apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y;
cd ~
git clone https://github.com/dogecoin/dogecoin
cd ~/dogecoin
BITCOIN_ROOT="~/dogecoin"
# Pick some path to install BDB to, here we create a directory within the dogecoin directory
BDB_PREFIX="${BITCOIN_ROOT}/db5"
mkdir -p $BDB_PREFIX
# Fetch the source and verify that it is not tampered with

cp ~/TPM/install/bdb.tar.gz $BDB_PREFIX/bdb.tar.gz
# -> db-5.1.29.NC.tar.gz: OK
tar -xzvf bdb.tar.gz
# Build the library and install to our prefix
cd db-5.1.29.NC/build_unix/
#  Note: Do a static build so that it can be embedded into the executable, instead of having to find a .so at runtime
../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$BDB_PREFIX --build=x86_64 #Replace with your build if needed. 
make install
# Configure Dogecoin Core to use our own-built instance of BDB
cd $BITCOIN_ROOT
./autogen.sh
./configure LDFLAGS="-L${BDB_PREFIX}/lib/" CPPFLAGS="-I${BDB_PREFIX}/include/" # (other args...)
make
make install
read -p "Is it ok? <y/N> " prompt
if [ $prompt == "y" ]
then
  echo "Ok.";
  # http://stackoverflow.com/questions/1537673/how-do-i-forward-parameters-to-other-command-in-bash-script
else
  echo "Fuck";
  exit 0
fi
