#!/usr/bin/env bash

/var/www/symfony/bin/console doctrine:schema:create
/var/www/symfony/bin/console doctrine:fixtures:load --fixtures=src/AppBundle/DataFixtures/ORM/Scenarios/Hanoi/ --append
/var/www/symfony/bin/console doctrine:fixtures:load --fixtures=src/AppBundle/DataFixtures/ORM/Scenarios/RioPrimero/ --append