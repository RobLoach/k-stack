#!/bin/bash

/root/.composer/vendor/bin/drush make *.make /var/www
ln -sf /profile "/var/www/profiles/kaladock"
cd /var/www
/root/.composer/vendor/bin/drush site-install kaladock --yes \
  --db-url=mysql://root:password@localhost:3306/database \
  --account-name="admin" \
  --account-pass="admin"

#  --db-url=sqlite://sites/default/files/.ht.sqlite \