gitlist-docker
==============

A ready to use docker image with preinstalled apache and gitlist.

You can use it to quickly expose a web interface of the git repositories in a
directory of your host machine.

Usage
-----

You can build the image like this

    git clone <this repo>
    cd gitlist-docker
    docker build --rm=true -t gitlist .

And run it like this

    docker run --rm=true -p 8888:80 -v /path/repo:/repos gitlist

You can mount a config.ini file into `/var/www/html/config.ini` to
update the settings.  For example if you want to enable the SSH URL.

The web interface will be available on host machine at port 8888 and will show
repositories inside /path/repo
