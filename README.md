# Methylation_JCU
Methylation Project (JCU)

# Requirement
Java >= v1.8.0_74
FastQC >= v0.11.9
Bismark >= v.022.3
Samtools >= v1.5
Bedtools >= v2.17.0
Minimap2 >= v2.17
Bowtie2 >= v2.2.3
Github >= v2.20.2 
R >= v3.0

# Install tools in linux (Ubuntu) environment 
Github 
  - sudo apt-get install git-core git-gui git-doc
  
Java
  - sudo apt-get update
  - sudo apt-get upgrade
  - sudo apt-get install openjdk-7-jre
  - sudo apt-get install openjdk-7-jdk

FastQC
  - sudo apt-get update
  - sudo apt-get install fastqc
  
Bismark 
  - see https://github.com/FelixKrueger/Bismark/tree/master/Docs

Samtools
  - see http://www.htslib.org/download/
  
Bedtools
  - see https://bedtools.readthedocs.io/en/latest/content/installation.html
  
Minimap2
  - see https://github.com/lh3/minimap2

Bowtie2
  - sudo apt-get update
  - sudo apt-get install bowtie2
  
R
  - sudo apt-get update
  - sudo apt-get install r-base
  
# User's Guide
This github repository contains bash scripts for methylation study. User can run the scripts in a sequential number based on the numbering of each script filename. Example:
  - 01_fastqc.sh                              ## Quality Control on raw reads using FastQC tool
  - 02_trim_galore.sh                         ## remove low quality reads and trimming low quality bases from input reads using trim_galore tool
  - 03_bismark_mapping.sh                     ## Mapping clean reads against reference genome using bismark tool
  - 04_align_sex_gene.sh                      ## align genes of interest to reference genome to obtain the alignment position
  - 05_subset_methyl_300up_200down.sh         ## subset BAM files from step 3 (e.g. 03_bismark_mapping.sh)
  - 06_bismark_mapping_subset_300up-200down.sh## rerun bismark on the subset BAM files from step 5 (e.g 05_subset_methyl_300up_200down.sh)
  
 # Reference
 Lates Calcarifer reference genome
 http://laszlo.tll.org.sg/asb_genome/
 
 # Data in data folder
   - data/fish_sex_genes_TSS_300up_200down.bed  # 300bp upstream and 200bp down of TSS of each gene
   - subsetTSSsequence.sh                       # Script to obtain sequences (FASTA) located around TSS area if needed
 
# Download scripts
  - mkdir pipeline                                                    # create a new folder in a local machine
  - cd pipeline                                                       # change directory
  - git clone https://github.com/QFAB-Bioinformatics/Methylation_JCU  # download this repo to local machine
