SCRIPT=00_scripts/01_markDuplicates
HEADER=00_scripts/header.txt
NAME='cat 00_scripts/base.txt'
DATADIRECTORY=02_data
DATAOUT=03_MD

source env.txt

cd $WORKDIR
mkdir -p $SCRIPT
mkdir -p $DATAOUT

for FILE in $($NAME)
do
        cp $WORKDIR/$HEADER $WORKDIR/$SCRIPT/picard_${FILE##*/}.qsub ;
        echo "cd $WORKDIR/$DATADIRECTORY" >> $WORKDIR/$SCRIPT/picard_${FILE##*/}.qsub ;
        echo "java -Xmx60G -jar ${PICARDTOOLS}/MarkDuplicates.jar I=Aligned.sortedByCoord"$FILE".out.bam O=$WORKDIR/$DATAOUT/"$FILE".sorted_MD.bam M=$WORKDIR/$DATAOUT/"$FILE".MarkDup_metrics.txt ASSUME_SORTED=TRUE VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=TRUE CREATE_INDEX=TRUE" >> $WORKDIR/$SCRIPT/picard_${FILE##*/}.qsub ;
        qsub $WORKDIR/$SCRIPT/picard_${FILE##*/}.qsub;
done;

