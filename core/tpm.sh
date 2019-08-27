# TODO: put idea from my brain here.
clear
echo "==== T P M ====";
echo "What would you like to start?";
echo " (1) Application";
echo " (2) Module";
read cho;
if [ "$cho" == "1" ]; then
    clear;
    cd /home/`whoami`/TPM
    mkdir apps;
    cd apps;
    for f in *;
    do
         echo " (=) $f";
    done
    echo "Which application should I start?"
    read app;
    cd "$app";
    echo "==== START ====";
    sh start.sh;
    echo "==== APP CLOSED ====";
    echo " [Exit Code] - $?";
    exit;
fi
if [ "$cho" == "2" ]; then
    clear;
    cd /home/`whoami`/TPM
    mkdir mods;
    cd mods;
    for f in *;
    do
         echo " (=) $f";
    done
    echo "Which application should I start?"
    read app;
    cd "$app";
    echo "==== STARTING... ====";
    sh start.sh;
    echo "==== APP STARTED ====";
    exit;
fi
