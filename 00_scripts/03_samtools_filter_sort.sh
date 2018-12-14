WORKING_DIRECTORY=/home1/datawork/creisser/PERSIST/
SAMTOOLSENV=". /appli/bioinfo/samtools/1.4.1/env.sh"
INDIR=/home1/scratch/creisser/PERSIST/04_mapped
OUTDIR=/home1/datawork/creisser/PERSIST/04_mapped
LOG_FOLDER=/home1/datawork/creisser/PERSIST/98_log_files
NAME='cat /home1/datawork/creisser/PERSIST/00_scripts/base.txt'
SCRIPT=/home1/datawork/creisser/PERSIST/00_scripts/03_samtools_filter
HEADER=/home1/datawork/creisser/PERSIST/00_scripts/header.txt

mkdir -p $SCRIPT
mkdir -p $OUTDIR
cd $INDIR

for FILE in $($NAME)
do
	cp $HEADER $SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "cd $INDIR" >> $SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "$SAMTOOLSENV"  >> $SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "samtools view -b -F4 -F 256 -q5 "$FILE".sam -o $OUTDIR/"$FILE".bam"  >> $SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "samtools sort -@ 8 $OUTDIR/"$FILE".bam -o $OUTDIR/"$FILE".sorted.bam"  >> $SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "samtools index -b $OUTDIR/"$FILE".sorted.bam" >> $SCRIPT/samtools_${FILE##*/}.qsub ; 
	echo "rm $OUTDIR/"$FILE".bam" >> $SCRIPT/samtools_${FILE##*/}.qsub ;
	qsub $SCRIPT/samtools_${FILE##*/}.qsub ;
done ;

