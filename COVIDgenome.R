# This code is written by RicardoQi, and it is used to locate the S protein basepairs in the SARS-CoV-2 reference genome. The code is pushed to Github via https://github.com/RicardoQi/Rentrez.git
#Introducing rentrez 
library(rentrez)
#Enter the NCBI ID of the genome
ncbi_ids <- c("NC_045512.2")
#Using entrez_fetch to search for the genome and download it in fasta.
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
#The sequence is targeted and split in strings.
Sequences <- unlist(strsplit(Bburg, ">NC_045512.2 Severe acute respiratory syndrome coronavirus 2 isolate Wuhan-Hu-1, complete genome",fixed = TRUE))
#The newline characters are removed to make sure substring() works.
Sequences <- gsub("\\n", "", Sequences)
#Substring() to locate the S protein based on bp positions. 
sprotein <- substring(Sequences,21563,25384)
print(sprotein)
#According to the NCBI BLAST result of the genome, it is relatively highly conserved since it matches 100% with multiple sequences in the database, indicating that the genome has not changed or evolved much. 