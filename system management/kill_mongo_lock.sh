#!/bin/sh
sudo rm /var/lib/mongodb/mongod.lock
sudo service mongodb restart
