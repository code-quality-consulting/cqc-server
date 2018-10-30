echo "CQC Provisioning Script"
echo "User is $UESR"
echo "IP4 addresses associated with this host:"
hostname -I 
STATUS=0

#apt-get update
#apt-get upgrade --yes --force-yes

curl -sL https://raw.githubusercontent.com/creationix\
/nvm/v0.33.8/install.sh -o /tmp/install_nvm.sh
let STATUS=$STATUS+$?  

bash /tmp/install_nvm.sh
rm /tmp/install_nvm.sh

nvm install 9.6.1 # will install in user calling this script
let STATUS=$STATUS+$?  

APP="mail-endpoint"
APP_LOCAL="/root/$APP"
APP_GIT="https://github.com/code-quality-consulting/$APP.git"
APP_LOCAL_GIT=$APP_LOCAL/.git
APP_BRANCH="test-setup"

git clone $APP_GIT $APP_LOCAL
let STATUS=$STATUS+$?  

git --git-dir=$APP_LOCAL_GIT \
    --work-tree=$APP_LOCAL \
    checkout -b $APP_BRANCH
let STATUS=$STATUS+$?

#desired driven development :)
if [[ $STATUS = 0 ]]
then
  echo "Status: $STATUS, Provisioning was successful."
else
  echo "ERROR: provisioning status $STATUS not zero."
fi
