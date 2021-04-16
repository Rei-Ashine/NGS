#!/bin/bash

set -euo pipefail
sra=DRR006760.sra
fq1=DRR006760_1.fastq
fq2=DRR006760_2.fastq

fastq-dump --split-files ${sra}
gzip ${fq1}
gzip ${fq2}
