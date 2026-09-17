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

#### Environment variables

| Variable | Effect |
| -------- | ------ |
| `BLUERANGE_HOSTNAME` | Hostname of the BlueRange backend, replaces `auth_opt_http_hostname` |
| `BLUERANGE_PORT` | Port of the BlueRange backend, overrides `auth_opt_http_port` (default `8080`) |
| `BLUERANGE_WITH_TLS` | Whether the BlueRange backend is called via https, overrides `auth_opt_http_with_tls` (default `false`). Only the exact strings `true` and `false` are accepted |
| `MOSQUITTO_LISTENERS` | Which listeners to enable, see below |
| `MOSQUITTO_MAX_LOGIN_ATTEMPTS` | Adds `auth_opt_max_login_attempts_per_minute`. If unset, the auth plugin uses its own default |
| `PROMETHEUS_PASSWORD` | Password of the prometheus monitoring endpoint |
| `BLUERANGE_DISABLE_MONITORING` | If set to any value, the mqtt monitoring is not started |

#### Listeners

Four public listeners are prepared and can be enabled via configuration:

| Name  | Port | Protocol              |
| ----- | ---- | --------------------- |
| mqtt  | 1883 | MQTT                  |
| mqtts | 8883 | MQTT over SSL         |
| ws    | 8001 | MQTT over WebSocket   |
| wss   | 9001 | MQTT over secure WebSocket |

The selection is made with the `MOSQUITTO_LISTENERS` environment variable, which takes a
space or comma separated list of the names above, e.g. `MOSQUITTO_LISTENERS=mqtts,wss`.
Two special values exist:

- `auto` (the default) enables `mqtt` and `ws`, plus `mqtts` and `wss` if the server
  certificate and key have been mounted. This is necessary because mosquitto refuses to
  start if a `certfile` points to a file that does not exist.
- `none` only keeps the broker-local listener on 8885 that is used for monitoring.


## Contributing
Feel free to contribute to this chart by creating an [issue](https://github.com/bluerange-io/bluerange-kubernetes/issues/new) or a [pull request](https://github.com/bluerange-io/bluerange-kubernetes/pulls). Any support/bug reports/feature requests are welcome.
