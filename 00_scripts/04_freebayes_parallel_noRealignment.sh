DATADIRECTORY=04_Ncigar
OUTDIR=05_freebayes
HEADER=00_scripts/header-big-mem.txt
REF=01_info_files/sspace.final.scaffolds.fasta
INDEX=01_info_files/sspace.final.scaffolds.fasta.fai


cd $WORKDIR
mkdir -p $OUTDIR

cd $DATADIRECTORY

LS="ls $WORKDIR/$DATADIRECTORY/*.sorted_MD_split.bam"
$LS > 00_scripts/bam_list_freebayes.txt
BAM=00_scripts/bam_list_freebayes.txt

do
cp $WORDIR/$HEADER $WORDIR/00_scripts/04_freebayes_parallel_noRealignment.qsub ;
echo "NCPU=50" >> $WORDIR/00_scripts/04_freebayes_parallel_noRealignment.qsub ;
echo "nAlleles=4" >> $WORDIR/00_scripts/04_freebayes_parallel_noRealignment.qsub ;
echo "minMapQ=30" >> $WORDIR/00_scripts/04_freebayes_parallel_noRealignment.qsub ;
echo "minCOV=10" >> $WORDIR/00_scripts/04_freebayes_parallel_noRealignment.qsub ;
echo "$FREEBAYESENV" >> $WORDIR/00_scripts/04_freebayes_parallel_noRealignment.qsub ;
echo "freebayes-parallel <(fasta_generate_regions.py $WORKDIR/$INDEX 100000) "$NCPU" -f $REF --use-best-n-alleles $nAlleles -C 5 --min-mapping-quality $minMapQ --min-coverage $minCOV --genotype-qualities -L $BAM > $WORKDIR/$OUTDIR/daphnia_freebayes_parallel.vcf" >> $WORDIR/00_scripts/04_freebayes_parallel_noRealignment.qsub ;
qsub $WORDIR/00_scripts/04_freebayes_parallel_noRealignment.qsub ;
done ;





