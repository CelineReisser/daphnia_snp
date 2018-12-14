SCRIPT=/home1/datawork/creisser/GAMMA/genome_based/00_scripts/02_gatk
HEADER=/home1/datawork/creisser/GAMMA/genome_based/00_scripts/header-big-mem.txt
GATK="/home1/datahome/creisser/local-programs/GenomeAnalysisTK.jar"
NAME='cat /home1/datawork/creisser/GAMMA/genome_based/00_scripts/base.txt'
DATADIRECTORY=/home1/scratch/creisser/GAMMA/genome/01_MD
DATAOUT=/home1/scratch/creisser/GAMMA/genome/02_Ncigar
SAMTOOLS=". /appli/bioinfo/samtools/latest/env.sh" # samtools-1.4.1
ASSEMBLY="/home1/datawork/creisser/GAMMA/genome_based/01_info_files/sspace.final.scaffolds"
mkdir -p $SCRIPT
mkdir -p $DATAOUT


for FILE in $($NAME)
do
        cp $HEADER $SCRIPT/samtools_${FILE##*/}.qsub ;
        echo "cd $DATADIRECTORY" >> $SCRIPT/samtools_${FILE##*/}.qsub ;
	echo "java -Xmx23G -jar $GATK -T SplitNCigarReads -R "$ASSEMBLY".fasta -I $DATADIRECTORY/"$FILE".concordant_uniq.sorted_MD.bam -o $DATAOUT/"$FILE".concordant_uniq.sorted_MD_split.bam ;" >> $SCRIPT/samtools_${FILE##*/}.qsub ;
	qsub $SCRIPT/samtools_${FILE##*/}.qsub ;
done ;

