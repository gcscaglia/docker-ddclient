# docker-ddclient

## What is docker-ddclient?

docker-ddclient is a unofficial docker image for ddclient ([sf][1], [github][2]). docker-ddclient is based on on [Alpine linux][3] for simplicity and small footprint.

[1]: https://sourceforge.net/p/ddclient/wiki/Home/
[2]: https://github.com/wimpunk/ddclient
[3]: https://alpinelinux.org

## How to use this image

The image itself is very simple exposing no network ports and only a single volume (`/etc/ddclient`). One way to start a container could be:

```
docker run \
    --detach \
    --name ddclient \
    --restart always \
    --volume /etc/ddclient:/etc/ddclient:rw \
    gcscaglia/docker-ddclient:latest
```

With the above comand, `ddclient` will run in daemon mode, start with the system and read it's configurations from `/etc/ddclient/ddclient.conf` in the host's filesystem.

For info on how to craft the `ddclient.conf` file, please refer to the [documentation of ddclient][1] itself.

[1]: https://sourceforge.net/p/ddclient/wiki/Home/#configuration

### Caveats

By default containers don't have access to the host's network interfaces, instead accessing the network through the [docker bridge][1].

[1]: https://docs.docker.com/engine/userguide/networking/#default-networks

If your `ddclient.conf` determines your IP using `web` method, this difference in networking is irrelevant. If, instead, it uses the interface (`if`) method the easier solution is to change the container networking to `host` mode. i.e:

```
docker run \
    --detach \
    --name ddclient \
    --restart always \
    --volume /etc/ddclient:/etc/ddclient:rw \
    --net host \
    gcscaglia/docker-ddclient:latest
```

With `host` networking, all host interfaces are exposed directly to your container and can be used as-is.
