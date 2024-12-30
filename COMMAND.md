# Docker Registry Secret
kubectl create secret docker-registry ghcr-secret \
  --docker-server=ghcr.io \
  --docker-username=burakbalim \
  --docker-password=ghp_--- \
  --docker-email=hburakbalim@gmail.com
