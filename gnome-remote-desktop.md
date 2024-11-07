# gnome-remote-desktop

set gnome desktop credentials

```bash
#!/bin/bash

YOUR_USERNAME=tuana9a
YOUR_PASSWORD=password
echo -n "{\"password\":\"${YOUR_PASSWORD}\",\"username\":\"${YOUR_USERNAME}\"}" | secret-tool store --label "GRD RDP creds" xdg:schema org.gnome.RemoteDesktop.RdpCredentials
```
