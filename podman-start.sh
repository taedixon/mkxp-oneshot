podman pull registry.gitlab.steamos.cloud/steamrt/sniper/sdk
podman run \
--rm \
--init \
-v /home:/home \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-e HOME="$HOME" \
-h "$(hostname)" \
-v /tmp:/tmp \
-it \
registry.gitlab.steamos.cloud/steamrt/sniper/sdk:latest \
/bin/bash
