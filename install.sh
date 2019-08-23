#!/bin/bash
echo "#######                      #     #                               ";    
echo "#         ##   #####  #    # #  #  #   ##   #      #      ###### #####";
echo "#        #  #  #    # ##   # #  #  #  #  #  #      #      #        #";
echo "#####   #    # #    # # #  # #  #  # #    # #      #      #####    #";
echo "#       ###### #####  #  # # #  #  # ###### #      #      #        #";
echo "#       #    # #   #  #   ## #  #  # #    # #      #      #        #";
echo "####### #    # #    # #    #  ## ##  #    # ###### ###### ######   #";
echo "                                                                  ";
cat info/00-install.txt
echo "Are you sure you want to install? <y/N> ";
read pr
if [ "$pr"=="y" ]
then
  echo "Okey";
  # http://stackoverflow.com/questions/1537673/how-do-i-forward-parameters-to-other-command-in-bash-script
else
  exit 0
fi
apt install timeout -t
echo "=============";
echo "INSTALLING DOGE";
sh ./install/dogecoind.sh;
