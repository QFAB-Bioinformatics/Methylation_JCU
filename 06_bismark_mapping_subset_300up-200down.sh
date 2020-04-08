#!/bin/bash

module load bowtie2/2.2.3
module load samtools/1.5

sample=(24D1 24D2 24D3 28D1 28D2 28D3 34D1 34D2 34D5 FD1 FD2 FD3)

projectdir=/nfsmounts/qfab_data/bora_common/projects/17_05_02_NGS_Analysis_Hotel_Alyssa_Budd

bismark=${projectdir}/software/Bismark_v0.19.0/bismark
extractor=${projectdir}/software/Bismark_v0.19.0/bismark_methylation_extractor
report=${projectdir}/software/Bismark_v0.19.0/bismark2report
summary=${projectdir}/software/Bismark_v0.19.0/bismark2summary

outputdir=${projectdir}/analysis/minimap2/subset_methyl_data_300up-200down

extractordir=${projectdir}/analysis/minimap2/subset_methyl_data_300up-200down_extractor

refdir=${projectdir}/from_client/reference/

bismark_ext=_subset_sorted.bam

for f in "${sample[@]}"
do
    ${extractor} --output ${extractordir} --multicore 4 --buffer_size 5G -s --comprehensive --bedGraph --counts  --cytosine_report --genome_folder ${refdir} ${outputdir}/${f}${bismark_ext}
done
