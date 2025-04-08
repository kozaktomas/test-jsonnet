local params = {
    name: 'planet-exporter',
    image: 'ghcr.io/kozaktomas/planet-exporter:main',
    containerPort: 9042,
};

local k = (import "github.com/jsonnet-libs/k8s-libsonnet/1.32/main.libsonnet");


local deployment = function(name, image, port, replicas) {
  "apiVersion": "apps/v1",
  "kind": "Deployment",
  "metadata": {
     "name": name
  },
  "spec": {
     "replicas": replicas,
     "selector": {
        "matchLabels": {
            "app": name
        }
     },
     "template": {
        "metadata": {
           "labels": {
                "app": name
           }
        },
        "spec": {
           "containers": [
              {
                 "image": image,
                 "name": name,
                 "ports": [
                 {
                    "containerPort": port
                 }
                 ]
              }
           ]
        }
     }
  }

};

[
    deployment("karel", "ghcr.io/kozaktomas/planet-exporter:main", 9042, 1),
    deployment("matous", "ghcr.io/kozaktomas/planet-exporter:main", 9042, 2),
    k.apps.v1.deployment.new(name="lubos", containers=[
        k.core.v1.container.new(name="lubos", image="ghcr.io/kozaktomas/planet-exporter:main")
    ])

]