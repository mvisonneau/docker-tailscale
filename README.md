# tailscale-relay-over-k8s

Run a tailscale agent on top of K8S

```bash
# Add the helm repository to your local client
~$ helm repo add mvisonneau https://charts.visonneau.fr

# Install the relay
~$ helm install \
  tailscale-relay \
  mvisonneau/tailscale-relay \
  --set config.authKey=<yourauthkey>
```

More information on [how to use the chart here](https://github.com/mvisonneau/helm-charts/blob/main/charts/tailscale-relay).

## Credits

inspired by @hamishforbes [gist](https://gist.github.com/hamishforbes/2ac7ae9d7ea47cad4e3a813c9b45c10f)
