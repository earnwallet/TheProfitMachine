echo "checking if php is installed";
start=`date +%s`;
timeout 2 php -r "sleep(5);";
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 1 ]; then
    echo "php is installed";
else
    echo "Installing PHP";
    sudo apt-get install php7.3-cli -y
fi
