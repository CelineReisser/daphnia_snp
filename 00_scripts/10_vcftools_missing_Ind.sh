
INDIR=/home1/scratch/creisser/GAMMA/genome/04_freebayes


$VCFTOOLSENV
cd $INDIR

vcftools --vcf $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic.vcf --missing-indv

#vcftools --remove-indv HI.4880.006.NEBNext_dual_i7_A9---NEBNext_dual_i5_A9.17 --remove-indv HI.4880.008.NEBNext_dual_i7_A4---NEBNext_dual_i5_A4.98 --remove-indv HI.4880.008.NEBNext_dual_i7_B3---NEBNext_dual_i5_B3.97 --remove-indv HI.4880.007.NEBNext_dual_i7_C1---NEBNext_dual_i5_C1.61 --remove-indv HI.4880.007.NEBNext_dual_i7_G1---NEBNext_dual_i5_G1.9 --remove-indv HI.4880.006.NEBNext_dual_i7_F11---NEBNext_dual_i5_F11.119 --vcf $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_snp_noRealignment_final_biallelic.vcf --recode --out $INDIR/genome_pipeline_trial.vcf

