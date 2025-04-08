local k = (import "github.com/jsonnet-libs/k8s-libsonnet/1.32/main.libsonnet");

[
    k.apps.v1.deployment.new(name="lubos", containers=[
        k.core.v1.container.new(
            name="lubos",
            image="ghcr.io/kozaktomas/planet-exporter:main",
        )
        + k.core.v1.container.withImagePullPolicy("Always")
        + k.core.v1.container.withPorts([
            k.core.v1.containerPort.newNamed(
                containerPort=9042,
                name="sasek"
            )
        ])
    ], podLabels= {
       "app": "lubos",
       "test": "test123",
    })
]