#!/bin/bash

set -euo pipefail

./goldenminer --pubkey=5yuRCLRTqij1SSFfUutoA3PeqAkB5kcXwuEdGdjXTYN1FQMhMotaYGK --name=$(hostname)

# Echo status
echo "gpu miner is running now'"
