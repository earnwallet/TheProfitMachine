echo "checking if node is installed";
start=`date +%s`;
timeout 3 speed-test;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 2 ]; then
    echo "node is installed";
else
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs-dev
    # You may also need development tools to build native addons:
    #sudo apt-get install gcc g++ make -y
    sudo npm i -g speed-test
fi
