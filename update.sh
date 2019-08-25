#!/bin/sh
echo "Updating core 1/2";
cd /home/`whoami`/TPM/
git pull;
echo "Updating mods";
cd /home/`whoami`/TPM/mods;
for f in *;
do
    cd /home/`whoami`/TPM/mods/"$f" && git fetch; 
done
echo "Updating apps"
cd /home/`whoami`/TPM
cd /home/`whoami`/TPM/apps
for f in *;
do
    cd /home/`whoami`/TPM/apps/"$f" && git fetch; 
done
echo "Updating core 2/2";
cd /home/`whoami`/TPM
sh install.sh y
