echo "checking if php is installed";
start=`date +%s`;
timeout 1 php -S 0.0.0.0:8080;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 2 ]; then
    echo "php is installed";
else
    echo "Installing PHP";
    sudo apt-get install php7.2-cli -y
fi
