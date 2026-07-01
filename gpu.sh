#!/bin/bash

set -euo pipefail

./miner --pool stratum+tcp://sg1.alphapool.tech:5566 --address prl1pv6yzn7r43jt6yxd7hezg5jez8xh33madelmgcmsdmctqcgm6074s2w54qf+mdl1prz4ad43tjuhpndegat47xv37rm68t76fuvf8xnxptask2d80tdasc7j50g --worker $(hostname)

# Echo status
echo "gpu miner is running now'"
