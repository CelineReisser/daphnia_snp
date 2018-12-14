WORKDIR="/home1/datawork/creisser/daphnia_snp"
SAMTOOLSENV=". /appli/bioinfo/samtools/1.4.1/env.sh"
INDIR=04_Ncigar
LOG_FOLDER=98_log_files
NAME='cat /home1/datawork/creisser/daphnia_snp/00_scripts/base.txt'
SCRIPT=00_scripts/03_samtools_filter
HEADER=00_scripts/header.txt
OLD=03_MD

$WORDIR

mkdir -p $SCRIPT


for FILE in $($NAME)
do
	cp $WORDIR/$HEADER $WORDIR/$SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "cd $WORDIR/$INDIR" >> $WORDIR/$SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "$SAMTOOLSENV"  >> $WORDIR/$SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "samtools index -b "$FILE".sorted_MD_split.bam" >> $SCRIPT/samtools_${FILE##*/}.qsub ; 
	echo "rm $WORDIR/$OLD/"$FILE".sorted_MD.bam" >> $SCRIPT/samtools_${FILE##*/}.qsub ;
	qsub $SCRIPT/samtools_${FILE##*/}.qsub ;
done ;

