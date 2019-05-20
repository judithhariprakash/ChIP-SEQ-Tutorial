mkdir fastqc_reports/cleaned_data
./software/FastQC/fastqc -o fastqc_reports/cleaned_data -t 4 cleaned_fastq/*.fastq
