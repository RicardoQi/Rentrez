# This code is written by RicardoQi, and it downloads fasta formed dataset from NCBI. Then, the bp sequences are modified and saved as csv file.
library(stringr)

#Enter specific IDs from GenBank 
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
#load the rentrez package
library(rentrez)
#fetch DNA sequences based on ncbi_ids using entrez_fetch(), nuccore is the name of database, and fasta is the specific format that used to modify search results
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
#the sequences are separated and unlisted for further use. 
Sequences <- strsplit(Bburg,split = "\n\n")
Sequences <- unlist(Sequences)
#sequences are separated from the header
header <- gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq <- gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences <- data.frame(Name=header,Sequence=seq)
#the newline characters are removed 
Sequences$Sequence <- gsub("\\n", " ", Sequence)
#Modified sequences are output as csv file.
write.csv(Sequences, "C:\\Users\\qi199\\Documents\\Rentrez\\Sequences.csv",row.names = FALSE)