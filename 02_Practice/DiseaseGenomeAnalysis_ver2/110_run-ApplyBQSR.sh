#!/bin/bash

set -euo pipefail
ref=RefHg38/hg38.fasta
id=DRR006760
bami=${id}.sort.dedup.bam
bamo=${id}.sort.dedup.recal.bam
recaltab=${id}.sort.dedup.recaltab.txt

gatk ApplyBQSR \
    --input ${bami} \
    --output ${bamo} \
    --reference ${ref} \
    --bqsr-recal-file ${recaltab}
