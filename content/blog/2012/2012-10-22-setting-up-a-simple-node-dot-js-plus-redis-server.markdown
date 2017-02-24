---
# layout: post
title: "Simple Node.js + Redis Application - Part I (Setup)"
date: "2012-10-22"
# comments: true
# categories: nodejs redis
# published: false
tags: nodejs redis
---

I needed a server application to handle rating individual photos for a mobile application and to calculate the overall average rating of them.

To handle this I decided to try and implement a simple node.js and redis server combination. This pairing seemed to be a good fit and it also gave me the excuse to learn something now.

<!-- more -->

# Conceptual Server Application Stack

 * nginX - Revere-proxy
 * node.js - Server application logic
 * redis - Data persistence

<img src="https://docs.google.com/drawings/pub?id=17OmDsHY2IrZEhrHBR96HC-kDAlKtHKFTKIzlFoRHp8g&amp;w=720&amp;h=207">

# Development Environment

- OSX


## Node.js Setup

NVM (Node Version Manager)

Install and Setup NVM

```bash
git clone git://github.com/creationix/nvm.git ~/.nvm
~/.nvm/nvm.sh
nvm install 0.10.12

# Add the following to you shell profile (.zshrc | .bashrc)
. ~/.nvm/nvm.sh
nvm use 0.10.12 > /dev/null
```
Install the supporting node modules

* Global (npm install -g ???)
    * coffee-script
        * Allows us to write in coffee script instead of javascript
    * forever
        * Watches project file for changes and automatically restarts node server
* Project (npm install ???)
    * async
        * Used to easily handle synchronous and  asynchronous workflows and callback
    * redis
        * Node.js redis db wrapper
    * restify
        * Easily expose simple rest-base service end-points


package.json
```javascript
{
  "name": "APOD-Server",
  "version": "1.0.0",
  "description": "APOD Server",
  "author": "Elijah Cornell <elijah.cornell@gmail.com>",
  "main": "apod-server.js",
  "dependencies": {
    "async": ">= 0.1.22",
    "redis": ">= 0.8.1",
    "restify": ">= 1.4.4"
  },
  "engine": {
    "node": "0.10.x",
    "npm": "1.1.x"
  }
}
```

```bash
npm install -g coffee-script
npm install -g forever
npm update
```

## Redis Server Setup

```bash
# install redia via homebrew
brew install redis

# start cli
redis-server /usr/local/etc/redis.conf
```


## Run Program in watch mode
```bash
forever -w -c coffee apod-server.coffee
```

- GitHub


# Production Environment

- Linode
    - Debian

```bash
git clone git://github.com/creationix/nvm.git /opt/nvm
cd /opt/nvm
nvm install 0.10.12
```
