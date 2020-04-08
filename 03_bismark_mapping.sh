#!/bin/bash


###
# Organisation :QFAB
#
# Author : Mike
#
##


module load bowtie2/2.2.3
module load samtools/1.5


## This script runs bismark to map clean reads against reference genome

inputdir=../analysis/trimming

sample=(24D1 24D2 24D3 28D1 28D2 28D3 34D1 34D2 34D5 FD1 FD2 FD3)

projectdir=/nfsmounts/qfab_data/bora_common/projects/17_05_02_NGS_Analysis_Hotel_Alyssa_Budd

bismark=${projectdir}/software/Bismark_v0.19.0/bismark
extractor=${projectdir}/software/Bismark_v0.19.0/bismark_methylation_extractor
report=${projectdir}/software/Bismark_v0.19.0/bismark2report
summary=${projectdir}/software/Bismark_v0.19.0/bismark2summary

outputdir=../analysis/mapping

extractordir=../analysis/extractor

refdir=${projectdir}/from_client/reference/

ext1=_R1_val_1.fq.gz
ext2=_R2_val_2.fq.gz
bismark_ext=_R1_val_1_bismark_bt2_pe.bam
bismark_report_ext=_R1_val_1_bismark_bt2_PE_report.txt

for f in "${sample[@]}"
do
    ls ${inputdir}/${f}${ext1}
    ls ${inputdir}/${f}${ext2}
    ${bismark} -n 0 -l 22 --output_dir ${outputdir} --multicore 4 -p 4 --bowtie2  ${refdir}  -1 ${inputdir}/${f}${ext1} -2 ${inputdir}/${f}${ext2}
    ${extractor} --output ${extractordir} --multicore 4 --buffer_size 5G -s --comprehensive --bedGraph --counts  --cytosine_report --genome_folder ${refdir} ${outputdir}/${f}${bismark_ext}
    ${report} --alignment_report ${outputdir}/${f}${bismark_report_ext} --dir ${outputdir}
done
