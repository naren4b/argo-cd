Generate these values and copy to your private repos value files
#### Update the value file for adding new clusters 
```bash
#!/bin/bash
echo "Create the Service Account"
kubectl create sa argocd-manager -n kube-system
cat<<EOF | kubectl create -f - 
apiVersion: v1
kind: Secret
type: kubernetes.io/service-account-token
metadata:
  name: argocd-manager
  namespace: kube-system
  annotations:
    kubernetes.io/service-account.name: "argocd-manager"
EOF
# Note Cluster Admin is a full permission (we can check alternative https://github.com/argoproj/argo-cd/issues/5389)
echo "Create the rolebinding"
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=kube-system:argocd-manager argocd-manager-role

caData=$(kubectl config view --raw -o jsonpath="{.clusters[0].cluster.certificate-authority-data}")
token=$(kubectl get secret argocd-manager -n kube-system -o json | jq -r .data.token)
server=$(kubectl config view --raw -o jsonpath="{.clusters[0].cluster.server}")
name=$(kubectl config view --raw -o jsonpath="{.clusters[0].name}")
cat<<EOF > cluster-secrets-values.yaml  
clusters:
  ${name}: 
    name: ${name}
    server: ${server}
    caData: ${caData}
    token: ${token}
    insecure: false
	
EOF
cat cluster-secrets-values.yaml  
```
#### Update the value file for adding new repos 
```bash
url=https://github.com/naren4b # Change yours
name=naren4b # Change yours
username=naren4b # Change yours
password=${MY_GIT_TOKEN} # ref: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens

cat<<EOF >https-repo-creds-values.yaml
gitrepos:
  ${name}:  
    name: ${name}
    url: ${url}
    username: ${username}
    password: ${password}
EOF
cat https-repo-creds-values.yaml
```
