#!/bin/bash
GROUP=$1
URL=$2
MEMBERS=$3

GITOSIS_PATH="/home/favio/gitserver/gitosis-admin"



function create_group
{
    echo "[group $GROUP]
members=$MEMBERS
writable=$URL
"
}

function add_repo
{
    echo "
repo.url=$URL
repo.path=/home/git/repositories/$URL.git
repo.desc=$GROUP: $URL
"

}

# UPDATE GITOSIS CONF
create_group >> $GITOSIS_PATH/gitosis.conf
cd $GITOSIS_PATH
git commit -a -m "Allow write access to $URL for $MEMBERS"
git push


# SETUP INITIAL REPO
cd /tmp
mkdir $URL
cd $URL
git init
git remote add origin git@kloverfield.com:$URL.git
touch README
git add .
git commit -m "Add project README file"
git push origin master:refs/heads/master


# ADD REPO TO CGIT 
# still missing! xD

