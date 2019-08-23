echo "checking if node is installed";
start=`date +%s`;
timeout 10 speed-test;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 9 ]; then
    echo "node is installed";
else
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs` to install Node.js 12.x and npm
## You may also need development tools to build native addons:
     sudo apt-get install gcc g++ make -y
## To install the Yarn package manager, run:
     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn -y
    sudo npm i -g speed-test
fi
