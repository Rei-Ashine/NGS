#!/bin/bash

set -euo pipefail
id=DRR006760
ref=hg38
forig=${id}.${ref}_multianno.txt
f1=${id}.${ref}_p01_rare.txt
f2=${id}.${ref}_p02_trancate.txt
f3=${id}.${ref}_p02_nonsynonymous.txt
f4=${id}.${ref}_p03_trancate-hom.txt
f5=${id}.${ref}_p03_trancate-het.txt
f6=${id}.${ref}_p03_nonsyn-hom.txt
f7=${id}.${ref}_p03_nonsyn-het.txt

scripts/awk010_ToMMo35KJPNv2.awk \
    ${forig} > ${f1}
scripts/awk020_TrancateVariants.awk \
    ${f1} > ${f2}
scripts/awk030_NonsynonymousVariants.awk \
    ${f1} > ${f3}
scripts/awk040_Homozygous.awk \
    ${f2} > ${f4}
scripts/awk050_Heterozygous.awk \
    ${f2} > ${f5}
scripts/awk040_Homozygous.awk \
    ${f3} > ${f6}
scripts/awk050_Heterozygous.awk \
    ${f3} > ${f7}
fnames=(${forig} ${f1} ${f2} ${f3} ${f4} ${f5} ${f6} ${f7})
for fname in ${fnames[*]}; do
    wc -l ${fname}
done
