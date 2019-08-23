#!/bin/bash
echo " = = = = License = = = = ";
curl https://raw.githubusercontent.com/earnwallet/TheProfitMachine/master/license.txt;
echo " = = = =  E N D  = = = = ";
echo "Do you accept this license? [Y/n]"
read a
echo $a
if [ "$a" == "n" ]; then
    echo "xD"
    exit
fi
apt update; sudo apt install git -y;
git clone https://github.com/earnwallet/TheProfitMachine TPM
cd TPM && bash install.sh
echo "Installation complete.";
echo "before using tool you will more likely need to download some blockchain stuff, about 20gb... Do this by running blocksync after launching tpm";
echo "feel free to close terminal now.";
exit
