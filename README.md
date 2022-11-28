https://argo-cd.readthedocs.io/en/stable/operator-manual/applicationset/Generators-Matrix/



# Install kind cluster 
```
clusterName=demo
cd init
bash install.sh 
```

# Install argocd 
[Install ArgoCD](./init/argocd/README.md)

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
argocd login argocd.127.0.0.1.nip.io  --insecure
argocd account update-password

```
# Add repos
```
username=username
password=password
name=name

argocd repo add --type git --name ${name} https://github.com/naren4b/argo-cd.git --username ${username} --password ${password}
username=username
password=password
name=name
argocd repo add --type helm --name ${name}  http://chartmuseum.chartmuseum:8080/ --username ${username} --password ${password}
```