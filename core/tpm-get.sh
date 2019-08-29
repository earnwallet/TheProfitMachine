#!/bin/bash
echo "=============";
echo "Welcome to TheProfitMachine Package Manager tool." 
echo "=============";
echo "What would you like to install?";
echo " (1) Module";
echo " (2) Application";
read cho
if [ "$cho" == "1" ]; then
    echo "Interesting... Tell me more. Who's the owner?"
    echo "Username:";
    read username;
    echo "Hmm, okay. So $username right? I remember that $username work only on big stuff! Which one would you like to install?";
    echo "Package name:";
    read package
    echo "Okay..."
    echo "So I should install $package created by $username? [Y/n]";
    read a
    if [ "$a" == "y" -o "$a" == "Y" ]; then
        echo "Okay!";
    else
        echo "Umm... Okay, let's try again"
        sleep 2;
        bash /home/`whoami`/TPM/core/tpm-get.sh; 
        exit;
    fi
    bash /home/`whoami`/TPM/core/install.sh mod $username $package
fi
if [ "$cho" == "2" ]; then
    echo "Interesting... Tell me more. Who's the owner of this application?"
    echo "Username:";
    read username;
    echo "Hmm, okay. So $username right? I remember that $username... I'll tell you more about that guy later,";
    echo "Package name:";
    read package
    echo "Okay..."
    echo "So I should install $package created by $username? [Y/n]";
    read a
    if [ "$a" == "y" -o "$a" == "Y" ]; then
        echo "Okay!";
    else
        echo "Umm... Okay, let's try again"
        sleep 2;
        bash /home/`whoami`/TPM/core/tpm-get.sh; 
        exit;
    fi
    bash /home/`whoami`/TPM/core/install.sh app $username $package
fi
