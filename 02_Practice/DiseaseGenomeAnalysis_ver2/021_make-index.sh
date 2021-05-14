#!/bin/bash

refd=RefHg38
out=hg38.fasta

pushd ${refd}

bwa index ${out}
wait
ls -lh ${out}*

popd
