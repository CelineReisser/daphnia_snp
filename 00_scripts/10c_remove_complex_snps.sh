#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/GAMMA/genome_based/98_log_files
#PBS -N vcftools

INDIR=/home1/scratch/creisser/GAMMA/genome/04_freebayes

cd $INDIR

grep "^#" $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic_IndFiltered.recode.vcf > $INDIR/header.txt
awk '$4=="A"' $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic_IndFiltered.recode.vcf > $INDIR/A.txt
awk '$4=="C"' $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic_IndFiltered.recode.vcf > $INDIR/C.txt
awk '$4=="G"' $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic_IndFiltered.recode.vcf > $INDIR/G.txt
awk '$4=="T"' $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic_IndFiltered.recode.vcf > $INDIR/T.txt

cat header.txt A.txt C.txt G.txt T.txt > DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic_IndFiltered.recode_noComplex.vcf

rm header.txt
rm A.txt
rm C.txt
rm G.txt
rm T.txt




