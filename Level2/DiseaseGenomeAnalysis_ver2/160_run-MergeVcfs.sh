#!/bin/bash

set -euo pipefail
id=DRR006760
vcfs=${id}.snv.pass.vcf.gz
vcfi=${id}.indel.pass.vcf.gz
vcfo=${id}.all.pass.vcf.gz

picard MergeVcfs \
    INPUT=${vcfs} \
    INPUT=${vcfi} \
    OUTPUT=${vcfo}
