#!/bin/sh
echo "#######                      #     #                               ";    
echo "#         ##   #####  #    # #  #  #   ##   #      #      ###### #####";
echo "#        #  #  #    # ##   # #  #  #  #  #  #      #      #        #";
echo "#####   #    # #    # # #  # #  #  # #    # #      #      #####    #";
echo "#       ###### #####  #  # # #  #  # ###### #      #      #        #";
echo "#       #    # #   #  #   ## #  #  # #    # #      #      #        #";
echo "####### #    # #    # #    #  ## ##  #    # ###### ###### ######   #";
echo "                                                                  ";
cat info/00-install.txt
read -p "Are you sure you want to install? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
  # http://stackoverflow.com/questions/1537673/how-do-i-forward-parameters-to-other-command-in-bash-script
else
  exit 0
fi
sh ./install/dogecoind.sh
