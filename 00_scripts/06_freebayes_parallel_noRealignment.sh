#!/bin/bash
#PBS -q omp
#PBS -l walltime=100:00:00
#PBS -l ncpus=50
#PBS -lmem=115g
#PBS -N freebayes_transcriptome
#PBS -o /home1/datawork/creisser/GAMMA/genome_based/98_log_files

DATADIRECTORY=/home1/scratch/jleluyer/gamma/04_mapped/genome/gatk
OUTDIR=/home1/scratch/creisser/GAMMA/genome/04_freebayes
HEADER=/home1/datawork/creisser/GAMMA/genome_based/00_scripts/header-big-mem.txt
#FREEBAYESENV=/home1/datahome/creisser/local-programs/freebayes/bin
FREEBAYESENV=". /appli/bioinfo/freebayes/latest/env.sh"
REF=/home1/datawork/creisser/GAMMA/genome_based/01_info_files/sspace.final.scaffolds.fasta
INDEX=/home1/datawork/creisser/GAMMA/genome_based/01_info_files/sspace.final.scaffolds.fasta.fai

#$FREEBAYESENV
cd $DATADIRECTORY
mkdir -p $OUTDIR

#LS="ls $DATADIRECTORY/*dedup.bam"
LS="ls $DATADIRECTORY/*split.bam"
$LS > /home1/datawork/creisser/GAMMA/genome_based/00_scripts/bam_list_freebayes.txt
grep -v "A9.17" /home1/datawork/creisser/GAMMA/genome_based/00_scripts/bam_list_freebayes.txt >  /home1/datawork/creisser/GAMMA/genome_based/00_scripts/bam_list_final_freebayes.txt
BAM=/home1/datawork/creisser/GAMMA/genome_based/00_scripts/bam_list_final_freebayes.txt

NCPU=50
nAlleles=4
minMapQ=30
minCOV=10

$FREEBAYESENV

freebayes-parallel <(fasta_generate_regions.py $INDEX 100000) "$NCPU" \
-f $REF --use-best-n-alleles $nAlleles -C 5 --min-mapping-quality $minMapQ --min-coverage $minCOV --genotype-qualities -L $BAM > $OUTDIR/GAMMA_genome_split_noRealignment_parallel.vcf
#> $OUTDIR/GAMMA_genome_dedup_noRealignment_parallel.vcf
#> $OUTDIR/GAMMA_genome_split_noRealignment_parallel.vcf




