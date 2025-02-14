#!/bin/bash

set -e

GITHUB_USER="burakbalim"
REPO_NAME="kubernetes-infra"
HELM_REPO_URL="https://${GITHUB_USER}.github.io/${REPO_NAME}/"
HELM_CHARTS_DIR="helm"

git pull origin master

rm -rf charts
mkdir -p charts

find ${HELM_CHARTS_DIR} -name "Chart.yaml" | while read chart; do
    chart_dir=$(dirname "$chart")
    chart_name=$(basename "$chart_dir")

    echo "📦 Packaging chart: $chart_name"
    helm package "$chart_dir" -d charts/
done

echo "🔄 Updating Helm repo index..."
helm repo index charts --url ${HELM_REPO_URL}

mv charts/index.yaml .

echo "🚀 Pushing updates to GitHub..."
git add .
git commit -m "Update Helm repo index"
git push origin main

echo "✅ Helm charts successfully published at ${HELM_REPO_URL}"
