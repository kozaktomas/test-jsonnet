local params = {
    name: 'planet-exporter',
    image: 'ghcr.io/kozaktomas/planet-exporter:main',
    containerPort: 9042,
};


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
                name: name
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
    deployment("karel", "ghcr.io/kozaktomas/planet-exporter:main", 9042, 1)
]