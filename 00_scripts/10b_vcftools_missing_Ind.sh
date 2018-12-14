
INDIR=freebayes

$VCFTOOLSENV
cd $INDIR

vcftools --remove-indv  --vcf $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic.vcf --recode --out $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic_IndFiltered



