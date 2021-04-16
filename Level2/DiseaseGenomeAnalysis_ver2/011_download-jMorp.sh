#!/bin/bash

# ToMMo JRGv2 (insertion sequences bridged by Ns)
# https://jmorp.megabank.tohoku.ac.jp/202102/downloads/legacy/
u1="https://jmorp.megabank.tohoku.ac.jp/dj1/datasets/tommo-jrgv2/files"
u2="decoyJRGv2.fasta.zip"
u3="?download=true"
suffix=__TEMP__

curl -k ${u1}/${u2}${u3} -o ${u2}${suffix} \
    && mv ${u2}${suffix} ${u2}

unzip ${u2} && rm ${u2}
