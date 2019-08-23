#!/bin/bash
echo "=============";
echo "Welcome to TheProfitMachine Package Manager tool." 
echo "=============";
echo "What would you like to install?";
echo " (1) Module";
echo " (2) Add-on";
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
        tpm-get; 
        exit;
    fi
    echo "Before we proceed some paperwork is needed";
    echo "Read this carefully and tell me do you accept it or no, okay?"
    # resp=$(curl https://raw.githubusercontent.com/$username/TPMmod_$package/master/license.txt)
    # TODO: Check if repo exist.
    echo " - - - - LICENSE - - - - ";
    curl https://raw.githubusercontent.com/$username/TPMmod_$package/master/license.txt;
    echo "--------- E N D ---------";
    echo "Is this fair? [Y/n]";
    read a
    if [ "$a" == "y" -o "$a" == "Y" ]; then
        echo "Okay!";
    else
        echo "This is not any sort of advice, but next time click Y on your keyboard."
        exit;
    fi
    
fi
