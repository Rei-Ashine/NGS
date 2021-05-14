#!/bin/bash

set -euo pipefail
annovar=annovar/annotate_variation.pl
avdir=annovar-hg38
bver=hg38

mkdir -p ${avdir}
#${annovar} --buildver ${bver} -downdb cytoBand ${avdir}
# http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/cytoBand.txt.gz
u1="http://hgdownload.cse.ucsc.edu"
u2="goldenPath/hg38/database"
u3="cytoBand.txt.gz"
suffix=__TEMP__

curl ${u1}/${u2}/${u3} -o ${u3}${suffix} \
    && mv ${u3}${suffix} ${avdir}/hg38_${u3}
gunzip ${avdir}/hg38_${u3}


u1="http://www.openbioinformatics.org"
u2="annovar/download"
#${annovar} --buildver ${bver} -downdb refGene --webfrom annovar ${avdir}
# http://www.openbioinformatics.org/annovar/download/hg38_refGene.txt.gz
name="hg38_refGene.txt.gz"
curl ${u1}/${u2}/${name} -o ${name}${suffix} \
    && mv ${name}${suffix} ${avdir}/${name}
gunzip ${avdir}/${name}

#${annovar} --buildver ${bver} -downdb avsnp150 --webfrom annovar ${avdir}
# http://www.openbioinformatics.org/annovar/download/hg38_refGeneMrna.fa.gz
name="hg38_avsnp150.txt.gz"
curl ${u1}/${u2}/${name} -o ${name}${suffix} \
    && mv ${name}${suffix} ${avdir}/${name}
gunzip ${avdir}/${name}
name="hg38_refGeneMrna.fa.gz"
curl ${u1}/${u2}/${name} -o ${name}${suffix} \
    && mv ${name}${suffix} ${avdir}/${name}
gunzip ${avdir}/${name}

#${annovar} --buildver ${bver} -downdb gnomad_exome --webfrom annovar ${avdir}
# http://www.openbioinformatics.org/annovar/download/hg38_refGeneVersion.txt.gz
name="hg38_refGeneVersion.txt.gz"
curl ${u1}/${u2}/${name} -o ${name}${suffix} \
    && mv ${name}${suffix} ${avdir}/${name}
gunzip ${avdir}/${name}

