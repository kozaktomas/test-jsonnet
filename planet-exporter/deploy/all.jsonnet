local container = function(name, image, port) {
    "image": image,
    "name": name,
    "ports": [
        {"containerPort": port}
    ]
};

local deployment = function(name, annotations={}, containers=[], replicas=1) {
 "apiVersion": "apps/v1",
 "kind": "Deployment",
 "metadata": {
    "name": name,
    "annotations": annotations
 },
 "spec": {
    "replicas": replicas,
    "selector": {
       "matchLabels": {
          "app": name
       },
    },
    "template": {
       "metadata": {
          "labels": {
             "app": name
          }
       },
       "spec": {
            "containers": containers,
       }
    }
 }
};

[
    deployment(
        name="planet-exporter",
        annotations={
            "a": "1",
            "b": "2"
        },
        containers=[
            container("planet-exporter", "ghcr.io/kozaktomas/planet-exporter:main", 9042),
            container("planet-exporter-druhy", "ghcr.io/kozaktomas/planet-exporter:main", 9078),
        ]
    )

]
