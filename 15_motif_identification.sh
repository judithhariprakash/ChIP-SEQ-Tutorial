mkdir meme_output

#filter BED file to remove very short intervals
awk 'BEGIN{FS="\t";OFS="\t"}{ if ( $3 - $2 > 50) {print $0}}' ./macs2/analyzed/wt_common_broad_upstream100.bed > ./macs2/analyzed/wt_common_broad_upstream100_gt50_intervals.bed

# Sort bedfile and make sure merge together any overlapping intervals
./software/bedtools2/bin/bedtools sort -i ./macs2/analyzed/wt_common_broad_upstream100_gt50_intervals.bed | ./software/bedtools2/bin/bedtools merge -i stdin > ./macs2/analyzed/wt_common_broad_upstream100_gt50_intervals_merged.bed

#sample random 200 peaks
./software/bedtools2/bin/bedtools sample -n 200 -i ./macs2/analyzed/wt_common_broad_upstream100_gt50_intervals_merged.bed > ./macs2/analyzed/wt_common_broad_upstream100_gt50_intervals_merged_sample200.bed

# Make fasta of your peaks file
./software/bedtools2/bin/bedtools getfasta -fi ./resources/yeast_fasta/Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa -bed ./macs2/analyzed/wt_common_broad_upstream100_gt50_intervals_merged_sample200.bed -fo ./macs2/analyzed/wt_common_broad_upstream100_gt50_intervals_merged_sample200.fasta -name+

# Run MEME denovo discovery of motifs
./software/memebin/bin/meme -dna -revcomp -minw 10 -maxw 16 -oc ./meme_output/wt_common_broad_upstream100_gt50_intervals_merged_sample200 ./macs2/analyzed/wt_common_broad_upstream100_gt50_intervals_merged_sample200.fasta

# try running centrimo to scan motifs
# ./resources/meme_databases/motif_databases/YEAST/SwissRegulon_s_cer.meme
# http://meme-suite.org/doc/centrimo.html?man_type=web
