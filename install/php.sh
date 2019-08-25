echo "checking if php is installed";
start=`date +%s`;
timeout 2 php -S 0.0.0.0:8987;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 1 ]; then
    echo "php is installed";
else
    echo "Installing PHP";
    sudo apt-get install php7.2-cli -y
fi
