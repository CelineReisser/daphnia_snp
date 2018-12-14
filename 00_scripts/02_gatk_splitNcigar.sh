WORKDIR="/home1/datawork/creisser/daphnia_snp"
SCRIPT=00_scripts/02_gatk
HEADER=00_scripts/header.txt
GATK="/home1/datahome/creisser/local-programs/GenomeAnalysisTK.jar"
NAME='cat /home1/datawork/creisser/GAMMA/genome_based/00_scripts/base.txt'
DATADIRECTORY=03_MD
DATAOUT=04_Ncigar
SAMTOOLS=". /appli/bioinfo/samtools/latest/env.sh" # samtools-1.4.1
ASSEMBLY="01_info_files/sspace.final.scaffolds"
mkdir -p $SCRIPT
mkdir -p $DATAOUT

cd $WORKDIR
for FILE in $($NAME)
do
        cp $WORKDIR/$HEADER $WORKDIR/$SCRIPT/Ncigar_${FILE##*/}.qsub ;
        echo "cd $WORKDIR/$DATADIRECTORY" >> $WORKDIR/$SCRIPT/Ncigar_${FILE##*/}.qsub ;
	echo "java -Xmx60G -jar $GATK -T SplitNCigarReads -R "$ASSEMBLY".fasta -I "$FILE".concordant_uniq.sorted_MD.bam -o $WORKDIR/$DATAOUT/"$FILE".concordant_uniq.sorted_MD_split.bam ;" >> $WORKDIR/$SCRIPT/Ncigar_${FILE##*/}.qsub ;
	qsub $WORKDIR/$SCRIPT/Ncigar_${FILE##*/}.qsub ;
done ;

