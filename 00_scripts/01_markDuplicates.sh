SCRIPT=/home1/datawork/creisser/GAMMA/genome_based/00_scripts/01_markDuplicates
HEADER=/home1/datawork/creisser/GAMMA/genome_based/00_scripts/header-big-mem.txt
PICARDTOOLS="/home1/datahome/creisser/local-programs/picard-tools-1.119"
NAME='cat /home1/datawork/creisser/GAMMA/transcriptome_based/00_scripts/base.txt'
DATADIRECTORY=/home1/datawork/creisser/GAMMA/genome_based/02_data
DATAOUT=/home1/scratch/creisser/GAMMA/genome/01_MD

mkdir -p $SCRIPT
mkdir -p $DATAOUT

for FILE in $($NAME)
do
        cp $HEADER $SCRIPT/picard_${FILE##*/}.qsub ;
#	echo "module load java" >> $SCRIPT/picard_${FILE##*/}.qsub ;
        echo "cd $DATADIRECTORY" >> $SCRIPT/picard_${FILE##*/}.qsub ;
        echo "java -Xmx23G -jar ${PICARDTOOLS}/MarkDuplicates.jar I="$FILE".concordant_uniq.sorted.bam O=$DATAOUT/"$FILE".concordant_uniq.sorted_MD.bam M=$DATAOUT/"$FILE".MarkDup_metrics.txt ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=TRUE CREATE_INDEX=TRUE" >> $SCRIPT/picard_${FILE##*/}.qsub ;
        qsub $SCRIPT/picard_${FILE##*/}.qsub;
done;

