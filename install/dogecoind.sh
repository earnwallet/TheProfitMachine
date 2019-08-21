#!/bin/sh
echo "Step 0. Install software.";
apt-get install build-essential libtool autotools-dev automake pkg-config libssl-dev libevent bsdmainutils libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev -y;
read -p "Is it ok? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
  echo "Ok continuing";
  # http://stackoverflow.com/questions/1537673/how-do-i-forward-parameters-to-other-command-in-bash-script
else
  echo "Fuck";
  exit 0
fi
