# SRR5284411 GSM2507888 wt(pSET1) input DNA rep1
# SRR5284412 GSM2507889 wt(pSET1) H3K4me3 ChIP-Seq rep1
# SRR5284416 GSM2507893 wt(pSET1) input DNA rep2
# SRR5284417 GSM2507894 wt(pSET1) H3K4me3 ChIP-Seq rep2
# SRR5284421 GSM2507898	pset1delta500 input DNA rep1
# SRR5284422 GSM2507899	pset1delta500 H3K4me3 ChIP-Seq rep1
# SRR5284426 GSM2507903	pset1delta500 input DNA rep2
# SRR5284427 GSM2507904	pset1delta500 H3K4me3 ChIP-Seq rep2

mkdir macs2
cd macs2
mkdir broadpeaks narrowpeaks

cd broadpeaks
mkdir wt_rep1 wt_rep2 mut_rep1 mut_rep2
cd ..

cd narrowpeaks
mkdir wt_rep1 wt_rep2 mut_rep1 mut_rep2
cd ../..

cmd="./software/python2/bin/macs2 callpeak -f BAM --keep-dup all -g 15e6 -t 37 --shift -13 --mfold 2 20 --broad --broad-cutoff 0.01"
$cmd -t aligned/bam/SRR5284412_1_duprm.bam -c aligned/bam/SRR5284411_1_duprm.bam --outdir macs2/broadpeaks/wt_rep1 
$cmd -t aligned/bam/SRR5284417_1_duprm.bam -c aligned/bam/SRR5284416_1_duprm.bam --outdir macs2/broadpeaks/wt_rep2
$cmd -t aligned/bam/SRR5284422_1_duprm.bam -c aligned/bam/SRR5284421_1_duprm.bam --outdir macs2/broadpeaks/mut_rep1
$cmd -t aligned/bam/SRR5284427_1_duprm.bam -c aligned/bam/SRR5284421_1_duprm.bam --outdir macs2/broadpeaks/mut_rep2

cmd="./software/python2/bin/macs2 callpeak -f BAM --keep-dup all -g 15e6 -t 37 --shift -13 --mfold 2 20"
$cmd -t aligned/bam/SRR5284412_1_duprm.bam -c aligned/bam/SRR5284411_1_duprm.bam --outdir macs2/narrowpeaks/wt_rep1 
$cmd -t aligned/bam/SRR5284417_1_duprm.bam -c aligned/bam/SRR5284416_1_duprm.bam --outdir macs2/narrowpeaks/wt_rep2
$cmd -t aligned/bam/SRR5284422_1_duprm.bam -c aligned/bam/SRR5284421_1_duprm.bam --outdir macs2/narrowpeaks/mut_rep1
$cmd -t aligned/bam/SRR5284427_1_duprm.bam -c aligned/bam/SRR5284421_1_duprm.bam --outdir macs2/narrowpeaks/mut_rep2

