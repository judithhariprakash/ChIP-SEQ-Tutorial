mkdir macs2/analyzed

#intersect two replicates
./software/bedtools2/bin/bedtools intersect -a ./macs2/broadpeaks/wt_rep1/NA_peaks.broadPeak -b ./macs2/broadpeaks/wt_rep2/NA_peaks.broadPeak > ./macs2/analyzed/wt_common_broad.bed

# check number of common peaks
wc -l ./macs2/analyzed/wt_common_broad.bed

# try the same for broadpeaks from replicates of MUT

# Unique peaks
./software/bedtools2/bin/bedtools intersect -v -a ./macs2/broadpeaks/wt_rep1/NA_peaks.broadPeak -b ./macs2/broadpeaks/wt_rep2/NA_peaks.broadPeak > ./macs2/analyzed/wt_r1_unique_comp_r2.bed
wc -l ./macs2/analyzed/wt_r1_unique_comp_r2.bed

# check unqiue peaks between mut and wt common peaks
# check unique peaks between broadpeaks and narrowpeaks

# Using Bedtools Flank to create a Promoter region (-100 upstream). TSS exactly will not be included in  final coordinates. Always remember that in Bedtools the end coordinate  nucleaotide is excluded so that the actual interval is only till end-1.
./software/bedtools2/bin/bedtools flank -l 100 -r 0 -s -i ./resources/annotation/genes.bed -g ./resources/annotation/karyotype.tsv > ./resources/annotation/promoter_upstream_100.bed

# try 500 downstream of TSS
# try +/- 500 of TSS 

# Check how many WT common peaks and how many MUT common peaks in promoter upstream 100 region
./software/bedtools2/bin/bedtools intersect -a ./macs2/analyzed/wt_common_broad.bed -b ./resources/annotation/promoter_upstream_100.bed > ./macs2/analyzed/wt_common_broad_upstream100.bed


# flank cannot take negative values for 'l' and 'r' parameters however slop can and that is why they are great for modifying shifted intervals. For example if we want to get the exact coordinate of TSS. We can simply use Slop on the promoter_upstream_500.bed file that we created above.
./software/bedtools2/bin/bedtools slop -l -500 -r 0 -s -i ./resources/annotation/promoter_upstream_500.bed -g ./resources/annotation/karyotype.tsv > ./resources/annotation/tss.bed
./software/bedtools2/bin/bedtools sort -i ./resources/annotation/tss.bed > ./resources/annotation/tss_sorted.bed

# Now we will use Bedtools Closest to identify nearest intervals. For example we can ask which peak is nearest to TSS. Check the last column of output files after running bedtools closest
./software/bedtools2/bin/bedtools sort -i ./macs2/analyzed/wt_common_broad.bed > ./macs2/analyzed/wt_common_broad_sorted.bed

./software/bedtools2/bin/bedtools closest -D ref -a ./resources/annotation/tss_sorted.bed -b ./macs2/analyzed/wt_common_broad_sorted.bed > ./macs2/analyzed/wt_common_broad_tss_closest.bed

# check how ties are handled for determined closest feature to TSS. What happens when peaks overlap with TSS? Can you exclude such peaks? Can you excldue downstream peaks?





