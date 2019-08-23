echo "checking if node is installed";
start=`date +%s`;
timeout 10 speed-test;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 9 ]; then
    echo "node is installed";
else
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo npm i -g speed-test
fi
