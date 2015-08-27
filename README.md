# Official phpBB3 Container on EdenServers

[![Run on EdenServers](https://img.shields.io/badge/EdenServers-view-blue.svg)](http://www.edenservers.us)
[![](https://badge.imagelayers.io/edenservers/phpbb:latest.svg)](https://imagelayers.io/?images=edenservers/phpbb:latest 'Get your own badge on imagelayers.io')

![](http://image.noelshack.com/fichiers/2015/35/1440692441-phpbb-logo.png)

All-in-one phpBB3 Server Container built for [EdenServers](http://www.edenservers.us).

It also includes an SCP server.

---

**This image is meant to be used on an EdenServers Server.**

Our images are built to specifically run for our services. You can run it directly with Docker though.

---
### 1.0.0 (2015-08-27)

This initial version contains:

* *phpBB 3.1.5*
* *scp* Server to upload and download files
* *mysql*

---

## Install

    $ docker pull edenservers/phpbb

---

## Config

| Environment Variable  | Description |
| ------------- | ------------- |
| USERNAME    | SCP Username  |
| PASSWORD     | SCP Password  |

| Port  | Description |
| ------------- | ------------- |
| 80 | phpBB3  |
| 22 | SCP  |

---

## Run example

    $  docker run -p 80:80 -p 1234:22 -e USERNAME=edenservers -e PASSWORD=edenservers --name phpbb -d edenservers/phpbb

On setup page :
* **database type** : mysql with mysqli extension
* **database name** : phpbb
* **username** : phpbb
* **password** : phpbb
* **host** : localhost

---

Made by [![EdenServers](http://image.noelshack.com/fichiers/2015/35/1440630894-logo.png)](https://www.edenservers.us)
