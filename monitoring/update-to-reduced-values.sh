#!/bin/bash
# Script to temporarily update monitoring stack to use reduced resource configurations

echo "Updating kustomization files to use reduced values..."

# Update Tempo kustomization
sed -i.bak 's/values\.yaml/values-reduced.yaml/g' monitoring/tempo/kustomization.yaml

# Update Loki kustomization  
sed -i.bak 's/values\.yaml/values-reduced.yaml/g' monitoring/loki/kustomization.yaml

# Update MinIO kustomization
sed -i.bak 's/values\.yaml/values-reduced.yaml/g' monitoring/minio/kustomization.yaml

# Update Thanos kustomization
sed -i.bak 's/values\.yaml/values-reduced.yaml/g' monitoring/thanos/kustomization.yaml

echo "Kustomization files updated."
echo ""
echo "To revert back to original values, run:"
echo "  mv monitoring/tempo/kustomization.yaml.bak monitoring/tempo/kustomization.yaml"
echo "  mv monitoring/loki/kustomization.yaml.bak monitoring/loki/kustomization.yaml"
echo "  mv monitoring/minio/kustomization.yaml.bak monitoring/minio/kustomization.yaml"
echo "  mv monitoring/thanos/kustomization.yaml.bak monitoring/thanos/kustomization.yaml" 