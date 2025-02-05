# docker-z2h-i3-arch-vnc

[![Docker Image Size](https://badgen.net/docker/size/z2hx/z2h-i3-arch-vnc)](https://hub.docker.com/r/z2hx/z2h-i3-arch-vnc)

A minimum docker image of Arch Linux with i3wm and VNC support.


## Pull image

```
docker pull z2hx/z2h-i3-arch-vnc
```

## Usage

Simple usage:

```
docker run -d --name z2h-i3-arch-vnc -p 5900:5900 -p 6080:6080 -e VNC_PASSWD=password -e USERNAME=arch z2hx/z2h-i3-arch-vnc
```

On the first startup, this image will install the i3 related packages.
You may need to wait a few minutes after creating the container.
This approach ensures that the base image is minimum.

Then visit <http://localhost:6080> to visit noVNC UI.
Or you can use a different VNC client (like TigerVNC client)
and connect to localhost:5900.

If `VNC_PASSWD` is not set,
the security type of tigervnc should be set to None in `/root/.vnc/config`,
it is **insecure** when exposing the container directly to the Internet.

If `USERNAME` is not set,
it will use root as the default user.
No password is set by default for the user.
You should change it after first login.

By default, noVNC will be installed and run.
Set `DISABLE_NOVNC` to `true` to disable it.

## Exposed ports

* 5900: Used for VNC interface
* 6080: Used for noVNC Web UI (if noVNC is enabled)

## Customization

The VNC config can be changed by mounting the config file at
`/root/.vnc/config`.
By default, the config file is empty.

Besides, `init.sh` and `start.sh` can be customized as well.

## Installed applications

* tigervnc
* noVNC (if noVNC is enabled)
* wget
* alacritty (a terminal emulator)

## Build

```
docker build -t z2h-i3-arch-vnc .
```


## FAQ

### Scaling

By default, noVNC's scaling mode is set to None.
It can be changed in the noVNC panel easily.


## License

MIT License
