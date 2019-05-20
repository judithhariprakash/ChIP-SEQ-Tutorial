mkdir bigwigs

cmd="./software/python2/bin/bamCoverage --normalizeUsing CPM --binSize 10 --effectiveGenomeSize 12000000 -p 3"

for i in aligned/bam/*_duprm.bam
do
    software/samtools-1.9/samtools index $i
done

$cmd -b aligned/bam/SRR5284411_1_duprm.bam -o bigwigs/WT_Input_rep1.bw
$cmd -b aligned/bam/SRR5284412_1_duprm.bam -o bigwigs/WT_H3K4me3_rep1.bw
$cmd -b aligned/bam/SRR5284416_1_duprm.bam -o bigwigs/WT_Input_rep2.bw
$cmd -b aligned/bam/SRR5284417_1_duprm.bam -o bigwigs/WT_H3K4me3_rep2.bw
$cmd -b aligned/bam/SRR5284421_1_duprm.bam -o bigwigs/MUT_Input_rep1.bw
$cmd -b aligned/bam/SRR5284422_1_duprm.bam -o bigwigs/MUT_H3K4me3_rep1.bw
$cmd -b aligned/bam/SRR5284426_1_duprm.bam -o bigwigs/MUT_Input_rep2.bw
$cmd -b aligned/bam/SRR5284427_1_duprm.bam -o bigwigs/MUT_H3K4me3_rep2.bw

