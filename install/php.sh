echo "checking if php is installed";
start=`date +%s`;
timeout 10 php -S 0.0.0.0:8080;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 9 ]; then
    echo "php is installed";
else
    echo "Installing PHP";
    apt-get install php7.2 -y
fi
