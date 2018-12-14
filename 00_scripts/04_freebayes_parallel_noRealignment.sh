WORKDIR="/home1/datawork/creisser/daphnia_snp"
DATADIRECTORY=04_Ncigar
OUTDIR=05_freebayes
HEADER=00_scripts/header-big-mem.txt
FREEBAYESENV=". /appli/bioinfo/freebayes/latest/env.sh"
REF=01_info_files/sspace.final.scaffolds.fasta
INDEX=01_info_files/sspace.final.scaffolds.fasta.fai

#$FREEBAYESENV
cd $WORKDIR
mkdir -p $OUTDIR

cd $DATADIRECTORY

LS="ls $WORKDIR/$DATADIRECTORY/*.sorted_MD_split.bam"
$LS > 00_scripts/bam_list_freebayes.txt
BAM=00_scripts/bam_list_freebayes.txt

NCPU=50
nAlleles=4
minMapQ=30
minCOV=10

$FREEBAYESENV

freebayes-parallel <(fasta_generate_regions.py $WORKDIR/$INDEX 100000) "$NCPU" \
-f $REF --use-best-n-alleles $nAlleles -C 5 --min-mapping-quality $minMapQ --min-coverage $minCOV --genotype-qualities -L $BAM > $WORKDIR/$OUTDIR/daphnia_freebayes_parallel.vcf





