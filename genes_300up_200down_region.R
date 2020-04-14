#This R script is used to recalculate the start and end position of the input file in BED format
#Example: 
#         2000    start position ( second column in BED file)
#         300     upstream of start position defined by user
#         200     downstream of start position defined by user
#Reulst:
#         1700    2200  becomes the result of second and third column in BED file


genes<-read.table("data/fish_sex_genes_TSS_mapping_sorted.bed",header=F,sep="\t")
genes
#       V1       V2       V3                            V4 V5 V6
#  ASB_LG2  7179565  7184196 Lates_calcarifer_Cyp19A1_gene 60  -
# ASB_LG17 16944173 17012270   Lates_calcarifer_nr5a2_gene 60  +
genes$upstream_start<-genes$V2 - 300
genes$downstream_end<-genes$V2 + 200


write.table(genes[,c(1,7,8,4,5,6)],file="fish_sex_genes_300up_200down.bed",col.names=F,row.names=F,quote=F,sep="\t")

