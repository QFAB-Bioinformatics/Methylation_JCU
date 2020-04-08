#!/bin/bash 


module load samtools/1.5
module load bedtools/2.17.0

sample=(24D1 24D2 24D3 28D1 28D2 28D3 34D1 34D2 34D5 FD1 FD2 FD3)

BED_FILE=../analysis/minimap2/TSS/fish_sex_genes_TSS_300up_200down.bed

METHYL_BAM_DIR=../analysis/mapping


OUTPUT=../analysis/minimap2/TSS/subset_methyl_data_300up-200down_20200106

file_ext=_R1_val_1_bismark_bt2_pe.bam


for f in ${sample[@]}
do
   echo $f
    bedtools intersect -abam ${METHYL_BAM_DIR}/${f}${file_ext} -b ${BED_FILE} -f 1.0 > ${OUTPUT}/${f}_subset.bam
    samtools sort -o ${OUTPUT}/${f}_subset_sorted.bam ${OUTPUT}/${f}_subset.bam
    samtools index ${OUTPUT}/${f}_subset_sorted.bam
done


bedtools multicov -bams ${OUTPUT}/24D1_subset_sorted.bam ${OUTPUT}/24D2_subset_sorted.bam ${OUTPUT}/24D3_subset_sorted.bam ${OUTPUT}/28D1_subset_sorted.bam ${OUTPUT}/28D2_subset_sorted.bam ${OUTPUT}/28D3_subset_sorted.bam ${OUTPUT}/34D1_subset_sorted.bam ${OUTPUT}/34D2_subset_sorted.bam ${OUTPUT}/34D5_subset_sorted.bam ${OUTPUT}/FD1_subset_sorted.bam ${OUTPUT}/FD2_subset_sorted.bam ${OUTPUT}/FD3_subset_sorted.bam -bed ${BED_FILE} > ${OUTPUT}/methylation_expression_table.txt
