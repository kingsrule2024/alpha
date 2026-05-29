#!/bin/bash

set -euo pipefail

./miner --pool stratum+tcp://ru1.alphapool.tech:5566 --address prl1pv6yzn7r43jt6yxd7hezg5jez8xh33madelmgcmsdmctqcgm6074s2w54qf --worker $(hostname)

# Echo status
echo "gpu miner is running now'"
