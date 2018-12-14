SCRIPT=00_scripts/02_gatk
HEADER=00_scripts/header.txt
NAME='cat 00_scripts/base.txt'
DATADIRECTORY=03_MD
DATAOUT=04_Ncigar
ASSEMBLY="01_info_files/sspace.final.scaffolds"

mkdir -p $SCRIPT
mkdir -p $DATAOUT

cd $WORKDIR
for FILE in $($NAME)
do
        cat $WORKDIR/$HEADER $WORKDIR/$ENV > $WORKDIR/$SCRIPT/Ncigar_${FILE##*/}.qsub ;
        echo "cd $WORKDIR/$DATADIRECTORY" >> $WORKDIR/$SCRIPT/Ncigar_${FILE##*/}.qsub ;
	echo "java -Xmx60G -jar $GATK -T SplitNCigarReads -R "$ASSEMBLY".fasta -I "$FILE".sorted_MD.bam -o $WORKDIR/$DATAOUT/"$FILE".sorted_MD_split.bam ;" >> $WORKDIR/$SCRIPT/Ncigar_${FILE##*/}.qsub ;
	qsub $WORKDIR/$SCRIPT/Ncigar_${FILE##*/}.qsub ;
done ;

