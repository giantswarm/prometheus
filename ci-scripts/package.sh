#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

readonly PROJECT=$1
readonly TAG=$2
readonly VERSION=${TAG:1}

readonly HELM_URL=https://storage.googleapis.com/kubernetes-helm
readonly HELM_TARBALL=helm-v2.12.0-linux-amd64.tar.gz

main() {
  if ! setup_helm_client; then
    log_error "Helm client could not get installed."
    exit 1
  fi

  if ! package_chart "${PROJECT}" "${VERSION}"; then
    log_error "Helm Chart could not be packaged."
    exit 1
  fi

  echo "Successfully packaged ${PROJECT}-chart-${VERSION}.tgz"
}

setup_helm_client() {
    echo "Setting up Helm client..."

    curl --user-agent curl-ci-sync -sSL -o "${HELM_TARBALL}" "${HELM_URL}/${HELM_TARBALL}"
    tar xzf "${HELM_TARBALL}"

    PATH="$(pwd)/linux-amd64/:$PATH"
    helm init --client-only
}

package_chart() {
  local project="${1?Specify project}"
  local version="${2?Specify version}"

  # Replace CI version with release version
  sed -i 's/version:.*/version: '"${version}"'/' "helm/${project}-chart/Chart.yaml"

  helm package --save=false "helm/${project}-chart"
}

log_error() {
    printf '\e[31mERROR: %s\n\e[39m' "$1" >&2
}

main
