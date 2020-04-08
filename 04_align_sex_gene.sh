#!/bin/bash

### 
# Organisation :QFAB
# 
# Author : Mike
# 
##

module load samtools/1.5
module load bedtools/2.17.0

#This script is used to align fish sex gene to reference genome
#The output is in BED format which contains the start and end position of the fish sex genes

REF_DIR=../from_client/reference

INPUT_DIR=../from_client/reference/TSS

OUTPUT_DIR=../analysis/minimap2/TSS

MINIMAP2=/home/m.thang/minimap2/minimap2


${MINIMAP2} -ax splice -uf ${REF_DIR}/LatesCalcarifer_Genome_chromosomal_v3.fasta ${INPUT_DIR}/20191218_Lca_SexGenes_TSS.fasta > ${OUTPUT_DIR}/fish_sex_genes_TSS_mapping.sam

samtools view -S -b ${OUTPUT_DIR}/fish_sex_genes_TSS_mapping.sam > ${OUTPUT_DIR}/fish_sex_genes_TSS_mapping.bam

samtools sort ${OUTPUT_DIR}/fish_sex_genes_TSS_mapping.bam -o ${OUTPUT_DIR}/fish_sex_genes_TSS_mapping_sorted.bam

bedtools bamtobed -i ${OUTPUT_DIR}/fish_sex_genes_TSS_mapping_sorted.bam > ${OUTPUT_DIR}/fish_sex_genes_TSS_mapping_sorted.bed

