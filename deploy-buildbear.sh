#!/usr/bin/env bash

# deploy-buildbear.sh
# Usage:
#   chmod +x deploy-buildbear.sh
#   ./deploy-buildbear.sh

set -euo pipefail

BUILDBEAR_API_KEY="0b79467d-0922-48ad-802f-824bd6b30b37"
SANDBOX_SLUG="global-wolverine-ff979075"

export BUILDBEAR_API_KEY

echo "Starting deployment to BuildBear sandbox: ${SANDBOX_SLUG}"

# Example Foundry deployment
if command -v forge >/dev/null 2>&1; then
  forge script script/Deploy.s.sol:DeployScript \
    --rpc-url "https://rpc.buildbear.io/${SANDBOX_SLUG}" \
    --broadcast \
    -vvvv

# Example Hardhat deployment fallback
elif command -v npx >/dev/null 2>&1; then
  npx hardhat run scripts/deploy.js \
    --network buildbear

else
  echo "Error: forge or npx not found."
  exit 1
fi

echo "Deployment completed successfully."
