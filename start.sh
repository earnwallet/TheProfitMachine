cd /home/`whoami`/TPM
# bash update.sh
# TODO: Ask user if he want to do update or no.
# git pull
# screen -dm php -S 127.0.0.1:69042 /home/`whoami`/TPM/core/api
echo "Initializing aliases 1/2";
echo "Initializing tpm-get";
alias tpm-get="bash /home/`whoami`/TPM/core/tpm-get.sh";
echo "initializing tpm"
alias tpm="bash /home/`whoami`/TPM/core/tpm.sh"
echo "Initializing external aliases";

echo "Initializing aliases 2/2";
cd "/home/`whoami`/TPM/apps/"

for f in *;
do
    echo " [=] app: $f";
    alias $f="bash /home/`whoami`/TPM/apps/$f/start.sh";
    echo "    ==== I N F O ====";
    cat "/home/`whoami`/TPM/apps/$f/info.txt";
    echo "    ==== END INFO ====";
done;
cd "/home/`whoami`/TPM/mods/"
echo "    ==== D O N E ====";
echo "Starting background modules";
for f in *;
do
    echo " [=] mod: $f";
    echo "   ==== I N F O ==== ";
    cat "/home/`whoami`/TPM/mods/$f/info.txt";
    echo "   ==== END INFO ====";
    bash /home/`whoami`/TPM/mods/$f/start.sh;
    if [ $? == 0 ];
    then
        echo "Module $f started successfully";
    else
        echo "Non-zero error code occurred, exiting.";
        sleep 2;
        #exit;
    fi
done;
echo "Starting Dogecoin Wallet.";
dogecoind -daemon
echo "=============";
echo "Started, you can use TPM tools now.";
echo "=============";
