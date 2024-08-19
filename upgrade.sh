set -x

RELEASE=$1

helm repo update

helm upgrade --install $RELEASE ir-engine/ir-engine --values values/$RELEASE.values.yaml
