#!/bin/bash
SITE=$1
#TYPE=$2

LUSER="favio"
GIT_USERNAME="favrik"
SITES_FOLDER="/home/favio/web"

cd $SITES_FOLDER

su $LUSER -c "git clone git@kloverfield.com:$SITE.git"

#if ! test -z "$TYPE" ; then
#    su $LUSER -c "git clone git@github.com:$GIT_USERNAME/${TYPE}_project_skeleton.git $SITE"
#    rm -fr $SITE/.git
#fi

mkdir -p $SITE/public
mkdir -p $SITE/data/logs

chown -R $LUSER:$LUSER $SITE


function vhost
{
    echo "<VirtualHost *:80>
        ServerAdmin webmaster@$SITE
        ServerName $SITE
        DocumentRoot $SITES_FOLDER/$SITE/public
        <Directory $SITES_FOLDER/$SITE/public>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>
        CustomLog $SITES_FOLDER/$SITE/data/logs/apache-access.log combined
        ErrorLog  $SITES_FOLDER/$SITE/data/logs/apache-error.log
        LogLevel warn
        ServerSignature On
</VirtualHost>"

}

echo "127.0.0.1 $SITE" >> /etc/hosts
vhost > /etc/apache2/sites-available/$SITE
a2ensite $SITE
/etc/init.d/apache2 reload
