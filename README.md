# Dockerized Papermc Server
This repo offers paper minecraft servers prebuilt into a container so you don't have to install java, especially on arm systems since OpenJDK availability is extremely dependent on your distro.

## 🚀 Running
To run you can just use the [compose.yaml](/compose.yaml). It contains some script containers to fix permissions and accept the `eula.txt`.

Start it with `docker compose up -d`. The server will be available on `0.0.0.0:25565`.

### ℹ️ The container has no CLI interface!
**To modify your sever you need to edit the config files of the server and either `/reload` or restart the server**
I will check in following updates, if i can bind the server tty to the container tty in following updates.

## ⚙️ Other Versions
I have pre-build some versions for `arm64` and `amd64` architectures.

Versions start from 1.24.1 but you can build older Versions too.

Head over to [papermc.io](https://papermc.io/downloads/all) and get the Download Link, paste it into the `compose.yaml` in the `PAPER_URL` param and rebuild the container with `docker compose build`.
