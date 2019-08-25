git pull
echo "Starting Dogecoin Wallet.";
dogecoind -daemon
source ~/TPM/core/alias.sh
screen -dm php -S 127.0.0.1:69042 /home/`whoami`/TPM/core/api
echo "Done!";
