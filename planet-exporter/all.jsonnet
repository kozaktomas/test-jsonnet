local params = {
    name: 'planet-exporter',
    image: 'ghcr.io/kozaktomas/planet-exporter:main',
    containerPort: 9042,
};

local labels = function(name) {
    "app": params.name,
    "a": name,
    "b": name,
    "version": '0.1.69',
};

[
   {
      "apiVersion": "apps/v1",
      "kind": "Deployment",
      "metadata": {
         "name": params.name
      },
      "spec": {
         "replicas": 1,
         "revisionHistoryLimit": 3,
         "selector": {
            "matchLabels": labels(params.name),
         },
         "template": {
            "metadata": {
               "labels": labels(params.name),
            },
            "spec": {
               "containers": [
                  {
                     "image": params.image,
                     "name": params.name,
                     "ports": [
                     {
                        "containerPort": params.containerPort
                     }
                     ]
                  }
               ]
            }
         }
      }
   }
]