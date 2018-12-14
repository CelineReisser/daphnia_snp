DATADIRECTORY=/home1/scratch/creisser/GAMMA/genome/04_freebayes

$BCFLIBENV
cd $DATADIRECTORY

# Goal: remove the multi allelic list
# Manual for bcftools : http://samtools.github.io/bcftools/bcftools.html#view
# Use -m2 -M2 -v snps to only view biallelic SNPs.

bcftools view -m2 -M2 -v snps DP10_SNP_MAF0.1_miss0.1_GAMMA_genome.recode.vcf -o DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic.vcf

