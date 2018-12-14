#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/GAMMA/genome_based/98_log_files
#PBS -N vcffilter

INDIR=/home1/scratch/creisser/GAMMA/genome/04_freebayes
VCFLIBENV=". /appli/bioinfo/vcflib/1.0.0_rc1/env.sh"

$VCFLIBENV
cd $INDIR

vcffilter -g "DP > 10" -f "TYPE = snp" $INDIR/GAMMA_genome_split_noRealignment_parallel.vcf > $INDIR/DP10_SNP_GAMMA_genome.vcf


