#!/bin/bash

set -euo pipefail

tar zxvf annovar.latest.tar.gz
wait
./annovar/annotate_variation.pl
