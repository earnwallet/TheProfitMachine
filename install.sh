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
#if [ "$1" == "y" ];
#then
#   pr="y"
#else
#   read pr
#fi
if [ "1" == "1" ];
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

cd "/home/`whoami`/TPM/install/";
for f in *.sh;
do
	echo "Executing $f";
	bash $f;
	ec=$?
	if [ "$ec" == 0 ];
	then
		echo "[$ec] Success";
	else
		echo "[$ec] Failed!!!";
		exit 1;
	fi
done;
