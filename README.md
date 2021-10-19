# docker-tailscale

Run Tailscale (agent/relay) in a container

## Usage

### Docker

```bash
docker run -d \
  -e TAILSCALE_AUTH_KEY=<your_auth_key> \
  -v /dev/net/tun:/dev/net/tun \
  --network host \
  --privileged \
  mvisonneau/tailscale
```

### Kubernetes

```bash
# Add the helm repository to your local client
~$ helm repo add mvisonneau https://charts.visonneau.fr

# Install the relay
~$ helm install \
  tailscale-relay \
  mvisonneau/tailscale-relay \
  --set config.authKey=<your_auth_key>
```

More information on [how to use the chart here](https://github.com/mvisonneau/helm-charts/blob/main/charts/tailscale-relay).

## Credits

inspired by @hamishforbes [gist](https://gist.github.com/hamishforbes/2ac7ae9d7ea47cad4e3a813c9b45c10f)
