echo "checking if dogecoin core is installed";
start=`date +%s`;
timeout 10 speed-test;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 9 ]; then
    echo "Dogecoin core is installed";
else
    echo "Not enough doge, need to make more";
echo "checking if dogecoin core is installed";
start=`date +%s`;
timeout 10 dogecoind -printtoconsole;
end=`date +%s`
tim=`expr $end - $start`
if [ $tim -gt 9 ]; then
    echo "Dogecoin core is installed";
else
    echo "Not enough doge, need to make more";
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo npm i -g speed-test
fi
