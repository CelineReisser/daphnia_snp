#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/GAMMA/genome_based/98_log_files
#PBS -N BCFtools


DATADIRECTORY=/home1/scratch/creisser/GAMMA/genome/04_freebayes
BCFLIBENV=". /appli/bioinfo/bcftools/1.4.1/env.sh"

$BCFLIBENV
cd $DATADIRECTORY

# Goal: remove the multi allelic list
# Manual for bcftools : http://samtools.github.io/bcftools/bcftools.html#view
# Use -m2 -M2 -v snps to only view biallelic SNPs.

bcftools view -m2 -M2 -v snps DP10_SNP_MAF0.1_miss0.1_GAMMA_genome.recode.vcf -o DP10_SNP_MAF0.1_miss0.1_GAMMA_genome_biallelic.vcf

