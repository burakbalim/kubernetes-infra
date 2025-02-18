#!/bin/bash

set -e

GITHUB_USER="burakbalim"
REPO_NAME="kubernetes-infra"
HELM_REPO_URL="https://${GITHUB_USER}.github.io/${REPO_NAME}/helm-packages"

REPO_ROOT=$(pwd)
CHARTS_DIR="${REPO_ROOT}/helm-packages"

git pull origin master

rm -rf "${CHARTS_DIR}"
mkdir -p "${CHARTS_DIR}"

echo "🔍 Searching for Helm charts..."
find applications databases monitoring -type f -name "Chart.yaml" | while read chart; do
    chart_dir=$(dirname "$chart")
    parent_dir=$(basename "$(dirname "$chart_dir")")
    chart_name=$(basename "$chart_dir")

    echo "📦 Packaging chart: ${parent_dir}/${chart_name}"
    helm package "$chart_dir" -d "${CHARTS_DIR}/"
done

echo "🔄 Updating Helm repo index..."
helm repo index "${CHARTS_DIR}" --url "${HELM_REPO_URL}"

mv "${CHARTS_DIR}/index.yaml" "${REPO_ROOT}/index.yaml"

echo "🚀 Pushing updates to GitHub..."
git add .
git commit -m "Update Helm repo index"
git push origin master

echo "✅ Helm charts successfully published at ${HELM_REPO_URL}"
