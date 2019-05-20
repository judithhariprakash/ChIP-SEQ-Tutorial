mkdir aligned/bam

sts="software/samtools-1.9/samtools"
pic="java -jar software/picard.jar MarkDuplicates REMOVE_DUPLICATES=true"
for sam in aligned/sam/*.sam
do
    fn=`basename "$sam" | rev | cut -d"." -f2-  | rev`
    cmd1="${sts} view -u -q 20 ${sam} | ${sts} sort -@ - -o aligned/bam/${fn}.bam"
    cmd2="${pic} METRICS_FILE=aligned/bam/${fn}.metric.txt INPUT=aligned/bam/${fn}.bam OUTPUT=aligned/bam/${fn}_duprm.bam"
    echo $cmd1
    echo $cmd2
    eval $cmd1
    eval $cmd2
done



