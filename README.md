# Containerized papermc server
This repo offers paper minecraft servers prebuilt into a container so you don't have to install java, especially on arm systems since OpenJDK availability is extremely dependent on your distro.

## 🚀 Running
To run you can just use the [compose.yaml](/compose.yaml). It contains some script containers to fix permissions and accept the `eula.txt`.

Start it with `docker compose up -d`. The server will be available on `0.0.0.0:25565`.


## 💻 Accessing the Server CLI
**The container has no direct CLI interface!**
- Option 1
    - Add your self to the ops.json, see the [DOCS](https://docs.papermc.io/paper/reference/vanilla-data-files/#opsjson). Restart the server and you're able to use the CLI in-game

- Option 2
    - Enable 'rcon' and use a client like [mcrcon](https://github.com/Tiiffi/mcrcon) to connect to the server console.
    - In the `server.properties` set the following values:
        ```properties
        enable-rcon=true
        ...
        rcon.password=my-s3cr3t-p4ssw0rd!
        rcon.port=25575
        ```
    - restart and connect like this: `mcrcon -H 192.168.X.X -p s3cr3t-p4ssw0rd! -t`


## ⚙️ Other Versions
I have pre-build some versions for `arm64` and `amd64` architectures which are available in the [GitLab Container Registry](https://gitlab.com/PeeK1e/paper-server/container_registry/8600507).

But you can build other/custom versions too:
1. Clone the repo
2. Head over to [papermc.io](https://papermc.io/downloads/all) and get the Link for you preferred version
3. Replace `PAPER_URL` in the `compose.yaml` in the `services.mc.build` section
4. Rebuild the container with `docker compose build`


## 🔧 Modifying Launch Options
**THIS IS STRONGLY DISCOURAGED**

I am using the recommended launch options from the [papermc project docs](https://docs.papermc.io/paper/aikars-flags/).

If you however want to modify something else besides the max RAM usage, you can change the command to whatever you like.

Example:
```yaml
  mc:
    # modify launch options here (not recommended)
    command:
      - /usr/bin/java -Xmx500m -Xmx100m -jar /home/mc/paper.jar nogui
```
