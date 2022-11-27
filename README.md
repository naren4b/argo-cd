https://argo-cd.readthedocs.io/en/stable/operator-manual/applicationset/Generators-Matrix/



# Install kind cluster 
```
clusterName=demo
cd init
bash install ${clusterName}
```

# Install argocd 
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

```

# Install argod-client
```
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

``` 

# Setup the argod 
```
kubectl port-forward svc/argocd-server -n argocd 8080:443
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
argocd login localhost:8080  --insecure
argocd account update-password

```
