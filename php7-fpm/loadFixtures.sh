#!/usr/bin/env bash

composer install
composer update

HTTPDUSER=`ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1`
sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX var
sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:`whoami`:rwX var

/var/www/inowas/bin/console doctrine:schema:create
/var/www/inowas/bin/console doctrine:fixtures:load --fixtures=src/AppBundle/DataFixtures/ORM/Scenarios/Hanoi/ --append
/var/www/inowas/bin/console doctrine:fixtures:load --fixtures=src/AppBundle/DataFixtures/ORM/Scenarios/RioPrimero/ --append
