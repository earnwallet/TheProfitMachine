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
if [ "$1"=="y" ]
then
   pr="y"
else
   read pr
fi
if [ "$pr"=="y" ]
then
  echo "Okey";
  # http://stackoverflow.com/questions/1537673/how-do-i-forward-parameters-to-other-command-in-bash-script
else
  exit 0
fi
start=`date +%s`;
timeout 2 screen sleep 2;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 1 ]; then
    echo "timeout and screen is installed";
else
    echo "Installing timeout";
    sudo apt-get install coreutils -y
    sudo apt-get install timeout -y
    echo "Installing screen";
    sudo apt-get install screen -y
fi
echo "=============";
echo "INSTALLING PHP";
sh ./install/php.sh;
echo "=============";
echo "INSTALLING NODE";
sh ./install/node.sh;
echo "=============";
echo "INSTALLING DOGE";
sh ./install/dogecoind.sh;
