# call this file if you want to install new software, plz don't git clone or unzip files directly... please...

#example of usage can be found in core/tpm-get.sh
# bash /home/`whoami`/TPM/core/install.sh [mod|app] [GitHub username] [Package name]
type=$1; # mod or app
username=$2 # GitHub username of owner
package=$3 # what to install?

if [ "$type" == "mod" -o "$type" == "app" ];
then
    echo "Type ok.";
else
    echo "$type is not valid!";
    exit 1;
fi
echo "Before we proceed some paperwork is needed";
echo "Read this carefully and tell me do you accept it or no, okay?"
# resp=$(curl https://raw.githubusercontent.com/$username/TPM"$type"_$package/master/license.txt)
# TODO: Check if repo exist.
echo " - - - - LICENSE - - - - ";
curl https://raw.githubusercontent.com/$username/TPM"$type"_$package/master/license.txt;
echo "--------- E N D ---------";
echo "Is this fair? [Y/n]";
read a
if [ "$a" == "y" -o "$a" == "Y" ]; then
    echo "Okay!";
else
    echo "This is not any sort of advice, but next time click Y on your keyboard."
    exit 1;
fi
cd /home/`whoami`/TPM
mkdir "$type"s
cd "$type"s
echo "Cloning"
echo "screems *baa mee*" # sheep was first cloned animal.
git clone https://github.com/$username/TPM"$type"_$package $package
cd $package
echo "Installing...";
cd /home/`whoami`/TPM/"$type"s
chmod 777 ../$type -R
bash $package/install.sh
echo "Complete! $package $type is now available!"
sleep 3
exit;
