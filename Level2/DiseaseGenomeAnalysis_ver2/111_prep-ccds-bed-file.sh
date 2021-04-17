#!/bin/bash

set -euo pipefail
bedi=ccds.bed
sorted=ccds.sort0.bed
bedo=ccds.sort.bed

gunzip -c ${bedi}.gz > ${bedi}
wait
scripts/sort-bed.rb ${bedi} > ${sorted}
wait
bedtools merge -i ${sorted} > ${bedo}
