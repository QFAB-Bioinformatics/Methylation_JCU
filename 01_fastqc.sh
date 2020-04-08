#/bin/bash

###
# Organisation :QFAB
#
# Author : Mike
#
##

# This script is a quality control (QC) on raw reads using FASTQC tool

module load Java/1.8.0_74


FASTQC=../software/FastQC/fastqc

datadir=../from_client/data/WGBS_combined

sample=(24D2 24D3 28D1 28D2 28D3 34D1 34D2 34D5 FD1 FD2 FD3)

outputdir=../analysis/fastqc/

ext1=_R1.fastq.gz
ext2=_R2.fastq.gz

for f in "${sample[@]}"
do
   echo ${datadir}/${f}${ext1}
   ${FASTQC} -o ${outputdir} -t 4 ${datadir}/${f}${ext1}
   echo ${datadir}/${f}${ext2}
   ${FASTQC} -o ${outputdir} -t 4 ${datadir}/${f}${ext2}
done



