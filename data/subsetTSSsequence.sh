#!/bin/bash

module load bedtools/2.17.0


bedtools getfasta -fi ../../../from_client/reference/LatesCalcarifer_Genome_chromosomal_v3.fa -bed fish_sex_genes_TSS_300up_200down.bed -fo fish_sex_genes_300up_200down.fasta
