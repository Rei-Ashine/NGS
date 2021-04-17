#!/bin/bash

set -euo pipefail
fasta=RefHg38/hg38.fasta
dict=RefHg38/hg38.dict

picard CreateSequenceDictionary \
    REFERENCE=${fasta} \
    OUTPUT=${dict}
samtools faidx ${fasta}
