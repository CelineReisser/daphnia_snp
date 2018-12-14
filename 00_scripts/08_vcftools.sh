INDIR=/home1/scratch/creisser/GAMMA/genome/04_freebayes


$VCFTOOLSENV
cd $INDIR

vcftools --maf 0.1 --max-missing 0.9 --vcf $INDIR/DP10_SNP_GAMMA_genome.vcf --recode --out $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome

