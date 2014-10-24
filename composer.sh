#!/bin/bash
DEVLOCAL=$HOME/.devlocal

curl -sS https://getcomposer.org/installer | php
mv composer.phar $DEVLOCAL/bin/composer

composer g require psy/psysh:@stable
