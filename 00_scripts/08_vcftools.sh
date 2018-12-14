#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/GAMMA/genome_based/98_log_files
#PBS -N vcftools

INDIR=/home1/scratch/creisser/GAMMA/genome/04_freebayes
VCFTOOLSENV=". /appli/bioinfo/vcftools/0.1.14/env.sh"

$VCFTOOLSENV
cd $INDIR

vcftools --maf 0.1 --max-missing 0.9 --vcf $INDIR/DP10_SNP_GAMMA_genome.vcf --recode --out $INDIR/DP10_SNP_MAF0.1_miss0.1_GAMMA_genome

