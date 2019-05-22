cd resources/annotation
wget ftp://ftp.ensembl.org/pub/release-96/tsv/saccharomyces_cerevisiae/Saccharomyces_cerevisiae.R64-1-1.96.karyotype.tsv.gz
gunzip -d Saccharomyces_cerevisiae.R64-1-1.96.karyotype.tsv.gz
mv Saccharomyces_cerevisiae.R64-1-1.96.karyotype.tsv karyotype.tsv
cat karyotype.tsv
