mkdir aligned
mkdir aligned/sam
CMD="./software/bowtie2-2.3.5.1-linux-x86_64/bowtie2 -p 4 -x resources/bowtie2_index/index"
for fastq in cleaned_fastq/*.fastq
do
    fn=`basename "$fastq" | rev | cut -d"." -f2-  | rev`
    echo "${CMD} -U ${fastq} -S aligned/sam/${fn}.sam"
    eval "${CMD} -U ${fastq} -S aligned/sam/${fn}.sam"
done

