### install the ArgoCD 
```
cd argocd/
#update the value file
helm install argocd --namespace argocd  --create-namespace=true .
```
### Upgrade 
```
helm upgrade argocd --namespace argocd .
```

### Add the git repos manually 

## Configurations

| Key                                                  | Type   | Default | Description                                                  |
|------------------------------------------------------|--------|---------|--------------------------------------------------------------|
| argo-cd.server.ingress.enabled                       | bool   | FALSE   | Enable an ingress resource for the Argo CD server            |
| argo-cd.server.ingress.hosts                         | list   | []      | List of ingress hosts                                        |
| argo-cd.server.ingress.ingressClassName              | string | `""`    | Defines which ingress controller will implement the resource |
| argo-cd.server.ingress.labels                        | object | {}      | Additional ingress labels                                    |
| argo-cd.server.extraArgs                             | list   | []      | Additional command line arguments to pass to Argo CD server  |
| argo-cd.dex.metrics.enabled                          | bool   | FALSE   | Deploy metrics service                                       |
| argo-cd.dex.metrics.serviceMonitor.enabled           | bool   | FALSE   | Enable a prometheus ServiceMonitor                           |
| argo-cd.server.metrics.enabled                       | bool   | FALSE   | Deploy metrics service                                       |
| argo-cd.server.metrics.serviceMonitor.enabled        | bool   | FALSE   | Enable a prometheus ServiceMonitor                           |
| argo-cd.redis.metrics.enabled                        | bool   | FALSE   | Deploy metrics service                                       |
| argo-cd.redis.metrics.serviceMonitor.enabled         | bool   | FALSE   | Enable a prometheus ServiceMonitor                           |
| argo-cd.repoServer.metrics.enabled                   | bool   | FALSE   | Deploy metrics service                                       |
| argo-cd.repoServer.metrics.serviceMonitor.enabled    | bool   | FALSE   | Enable a prometheus ServiceMonitor                           |
| argo-cd.notifications.metrics.enabled                | bool   | FALSE   | Deploy metrics service                                       |
| argo-cd.notifications.metrics.serviceMonitor.enabled | bool   | FALSE   | Enable a prometheus ServiceMonitor                           |
| argo-cd.applicationSet.metrics.enabled               | bool   | FALSE   | Deploy metrics service                                       |
| argo-cd.applicationSet.metrics.serviceMonitor.enabled| bool   | FALSE   | Enable a prometheus ServiceMonitor                           |
| argo-cd.controller.metrics.enabled                   | bool   | FALSE   | Deploy metrics service                                       |
| argo-cd.controller.metrics.serviceMonitor.enabled    | bool   | FALSE   | Enable a prometheus ServiceMonitor                           |
| argo-cd.configs.repositories                         | object | {}      | Repositories list to be used by applications                 |
| argo-cd.configs.secret.createSecret                  | bool   | TRUE    | Create the argocd-secret                                     |
| argo-cd.configs.secret.argocdServerAdminPassword     | string | ""      | Bcrypt hashed admin password                                 |
