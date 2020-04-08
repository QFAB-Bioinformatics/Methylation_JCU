#!/bin/bash

###
# Organisation :QFAB
#
# Author : Mike
#
##

# This script is used to remove low quality bases and reads using trimgalore.

trimgalore=../software/TrimGalore-0.4.5/trim_galore


outputdir=../analysis/trimming

datadir=../from_client/data/WGBS_combined

sample=(24D1 24D2 24D3 28D1 28D2 28D3 34D1 34D2 34D5 FD1 FD2 FD3)

ext1=_R1.fastq.gz
ext2=_R2.fastq.gz

for f in "${sample[@]}"
do
   echo ${f}

   ${trimgalore} --trim-n --path_to_cutadapt /home/m.thang/.local/bin/cutadapt -o ${outputdir}/${f} --paired ${datadir}/${f}${ext1} ${datadir}/${f}${ext2}
done



