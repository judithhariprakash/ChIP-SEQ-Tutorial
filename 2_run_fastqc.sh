mkdir fastqc_reports
mkdir fastqc_reports/raw_data

./software/FastQC/fastqc -o fastqc_reports/raw_data -t 4 raw_data/*.fastq
