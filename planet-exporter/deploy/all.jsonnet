local deployment = function(name, image, port, replicas=1) {
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
       },
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
    deployment("planet-exporter", "ghcr.io/kozaktomas/planet-exporter:main", 9042)
]
