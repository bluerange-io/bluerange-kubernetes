# BlueRange Mosquitto

[BlueRange](https://bluerange.io) redefines the standard of modern real estate and introduces the future of digitized buildings - efficient, intelligent, secure.

## Installing

### Prerequisites
- Helm v3 [installed](https://helm.sh/docs/using_helm/#installing-helm)

Add the chart repository to Helm:

```bash
helm repo add bluerange https://bluerange-io.github.io/bluerange-kubernetes/
helm repo update
```

### Deploying BlueRange Mosquitto

```bash
helm install bluerange-mosquitto bluerange/bluerange-mosquitto -f my-values.yaml
```

## Contributing
Feel free to contribute to this chart by creating an [issue](https://github.com/bluerange-io/bluerange-kubernetes/issues/new) or a [pull request](https://github.com/bluerange-io/bluerange-kubernetes/pulls). Any support/bug reports/feature requests are welcome.
