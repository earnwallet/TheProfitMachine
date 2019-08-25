git pull
echo "Starting Dogecoin Wallet.";
dogecoind -daemon
cd ~/TPM/core
source alias.sh
screen -dm php -S 127.0.0.1:69042 /home/`whoami`/TPM/core/api
echo "Done!";
