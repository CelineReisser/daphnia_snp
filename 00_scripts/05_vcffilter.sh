INDIR=05_freebayes
HEADER=00_scripts/header.txt

do
cp $WORKDIR/$HEADER $WORKDIR/00_scripts/05_vcffilter.qsub ;
echo "$VCFLIBENV" >> $WORKDIR/00_scripts/05_vcffilter.qsub ;
echo "cd $WORKDIR/$INDIR" >> $WORKDIR/00_scripts/05_vcffilter.qsub ;
echo "vcffilter -g "DP > 15" -f "TYPE = snp" daphnia_freebayes_parallel.vcf > DP15_SNP_daphnia_freebayes_parallel.vcf" >> $WORKDIR/00_scripts/05_vcffilter.qsub ;
qsub $WORKDIR/00_scripts/05_vcffilter.qsub ;
done ;


