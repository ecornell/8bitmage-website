#! /bin/bash
hugo --buildDrafts=false
rsync -r -e ssh public/ ssh.8bitmage.com:/var/www/8bitmage
