---
# layout: post
title: "Firefox Tweak: Autohide Bookmark Menubar"
date: "2013-05-11"
# comments: true
tags: firefox
---

To minimize the amount of chrome in Firefox, I wanted to find a way to autohide the bookmark menubar.  I had found a couple userChrome.css tweaks, but they caused the rendered page to shift when the bookmark menubar was shown or hidden.  I created the following modified version to eliminate the shifting.  The tweak causes the bookmark menubar to fade in and out when the mouse hovers over the top navigation area.


This can be added directly to your userChrome.css file or loaded via Stylish. The top value will need to be modified depending on your OS.

Tested with Firefox 20.0 on OSX and Win8.
