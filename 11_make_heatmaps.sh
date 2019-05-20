mkdir heatmaps

cmd="./software/python2/bin/computeMatrix scale-regions -p 3 -a 1000 -b 1000 -R resources/annotation/genes.bed"
for bw in bigwigs/*.bw
do
    fn=`basename "$bw" | rev | cut -d"." -f2-  | rev`
    echo "$cmd -S $bw -o heatmaps/${fn}.mat"
    eval "$cmd -S $bw -o heatmaps/${fn}.mat"
    echo "./software/python2/bin/plotHeatmap -m heatmaps/${fn}.mat -o heatmaps/${fn}.png"
    eval "./software/python2/bin/plotHeatmap -m heatmaps/${fn}.mat -o heatmaps/${fn}.png"
done

./software/python2/bin/computeMatrix scale-regions -p 3 -a 1000 -b 1000 -R resources/annotation/genes.bed -S bigwigs/WT_H3K4me3_rep1.bw bigwigs/MUT_H3K4me3_rep1.bw -o heatmaps/wt_mut_chip_rep1.mat
./software/python2/bin/plotHeatmap -m heatmaps/wt_mut_chip_rep1.mat -o heatmaps/wt_mut_chip_rep1.png

