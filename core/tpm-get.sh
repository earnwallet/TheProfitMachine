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
    cd /home/`whoami`/TPM
    mkdir mods
    cd mods
    echo "Cloning"
    echo "screems *baa mee*" # sheep was first cloned animal.
    git clone https://github.com/$username/TPMmod_$package $package
    cd $package
    echo "Installing...";
    cd /home/`whoami`/TPM/mods
    chmod 777 mods -R
    bash $package/install.sh
    echo "Complete! This mod is now available!"
    sleep 3
    exit;
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
        tpm-get; 
        exit;
    fi
    echo "Before we proceed some paperwork is needed";
    echo "Read this carefully and tell me do you accept it or no, okay?"
    # resp=$(curl https://raw.githubusercontent.com/$username/TPMapp_$package/master/license.txt)
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
    cd /home/`whoami`/TPM
    mkdir apps
    cd apps
    echo "Cloning"
    echo "screems *baa mee*" # sheep was first cloned animal.
    git clone https://github.com/$username/TPMapp_$package $package
    cd $package
    echo "Installing...";
    cd /home/`whoami`/TPM/apps
    chmod 777 apps -R
    bash $package/install.sh
    echo "Complete! This app is now available!"
    sleep 3
    exit;
fi
