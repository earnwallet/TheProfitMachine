echo "checking if node is installed";
start=`date +%s`;
timeout 2 node -e "setTimeout(() => {console.log("hmm")},99999);";
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 1 ]; then
    echo "node is installed";
else
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt-get install -y nodejs
    # You may also need development tools to build native addons:
    sudo apt-get install gcc g++ make -y
fi
