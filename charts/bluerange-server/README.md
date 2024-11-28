# BlueRange

[BlueRange](https://bluerange.io) redefines the standard of modern real estate and introduces the future of digitized buildings - efficient, intelligent, secure.

## Installing

### Prerequisites
- Helm v3 [installed](https://helm.sh/docs/using_helm/#installing-helm)
- Relational database (ex. PostgreSQL/MariaDB) ready to use
- Optional: S3-compatible object storage ready to use

Add the chart repository to Helm:

```bash
helm repo add bluerange https://bluerange-io.github.io/bluerange-kubernetes/
helm repo update
```

### Customizing your values
```yaml
bluerangeServer:
  config:
    relution:
      server:
        externalURL: https://test.bluerange.io
      database:
        type: postgresql
        url: jdbc:postgresql://mycluster:5432/mydatabase
        username: <DATABASE_USER>
  environment:
    STORAGE_TYPE: S3
    STORAGE_S3_ACCESS_KEY: <AWS_ACCESS_KEY_ID>
    STORAGE_S3_BUCKET_NAME: my-bluerange-resources-bucket
    STORAGE_S3_BUCKET_REGION: eu-central-1
  secrets:
    DATABASE_PWD: <DATABASE_PASSWORD>
    STORAGE_S3_SECRET_KEY: <S3_SECRET_KEY>

ingress:
  enabled: true
  hosts:
    - host: bluerange.mydomain.com
      paths:
        - path: /
          pathType: ImplementationSpecific
```

### Deploying BlueRange

```bash
helm install bluerange-server bluerange/bluerange-server -f my-values.yaml
```

## Contributing
Feel free to contribute to this chart by creating an [issue](https://github.com/bluerange-io/bluerange-kubernetes/issues/new) or a [pull request](https://github.com/bluerange-io/bluerange-kubernetes/pulls). Any support/bug reports/feature requests are welcome.
