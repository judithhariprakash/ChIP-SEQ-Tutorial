mkdir cleaned_fastq
CMD="java -jar ./software/Trimmomatic-0.39/trimmomatic-0.39.jar SE"
OPTIONS="HEADCROP:13 TRAILING:25 SLIDINGWINDOW:4:20 MINLEN:30"
for fastq in raw_data/*.fastq
do
    fn=`basename "$fastq"`
    eval "${CMD} ${fastq} cleaned_fastq/${fn} ${OPTIONS}"
done
