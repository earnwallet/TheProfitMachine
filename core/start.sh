git pull
echo "Starting Dogecoin Wallet.";
dogecoind -daemon
echo "initializing tpm-get";
alias tpm-get="bash /home/`whoami`/TPM/core/tpm-get.sh";
echo "initializing tpm"
alias tpm="bash /home/`whoami`/TPM/core/tpm.sh"
# screen -dm php -S 127.0.0.1:69042 /home/`whoami`/TPM/core/api
echo "Done!";
