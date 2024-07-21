Generate these values and copy to your private repos value files
#### Update the value file for adding new clusters 
```bash
curl -Os https://gist.githubusercontent.com/naren4b/4af945b244f60d801ca77227cdeda861/raw/a0b28af2e06caaa7806953afdcb171278fe714e7/create-cluster-secret.sh 
bash create-cluster-secret.sh 

echo "Optional for Helm chart Value file" 
caData=$(kubectl config view --raw -o jsonpath="{.clusters[0].cluster.certificate-authority-data}")
token=$(kubectl get secret argocd-agent -n kube-system -o json | jq -r .data.token)
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
