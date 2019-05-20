mkdir resources
mkdir resources/yeast_fasta resources/annotation

cd resources/yeast_fasta
wget ftp://ftp.ensembl.org/pub/release-96/fasta/saccharomyces_cerevisiae/dna/Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa.gz
gunzip -d Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa.gz
echo
echo "Printing chromosome headers in the FASTA file"
echo
grep \> Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa

cd ../annotation
wget ftp://ftp.ensembl.org/pub/release-96/gtf/saccharomyces_cerevisiae/Saccharomyces_cerevisiae.R64-1-1.96.gtf.gz
gunzip -d Saccharomyces_cerevisiae.R64-1-1.96.gtf.gz
awk 'BEGIN{FS="\t";OFS="\t"}{if ($3 == "gene") {split($9,a,";"); split(a[1],b," "); if (b[1] == "gene_id") {print ($1,$4,$5,substr(b[2], 2, length(b[2]) - 2),"",$7)}} }' Saccharomyces_cerevisiae.R64-1-1.96.gtf > genes.bed

