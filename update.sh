#!/bin/sh
echo "Updating core 1/2";
cd /home/`whoami`/TPM/
git pull;
echo "Updating mods";
cd /home/`whoami`/TPM/mods;
for f in *;
do
    cd /home/`whoami`/TPM/mods/"$f" && git pull; 
done
echo "Updating apps"
cd /home/`whoami`/TPM
cd /home/`whoami`/TPM/app
for f in *;
do
    cd /home/`whoami`/TPM/app/"$f" && git pull; 
done
echo "Updating core 2/2";
cd /home/`whoami`/TPM
sh install.sh y
