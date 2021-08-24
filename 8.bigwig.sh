#! /bin/bash
#$ -cwd

#SBATCH -c 5
#SBATCH -t 12:00:00 
#SBATCH --mem=20GB 
#SBATCH -a 1-3

samplesheet="/mnt/isilon/diskin_lab/rawan/slurm/chip-seq_processing/bwa.align/nbl_chipseq/maris/bigwig_maris.txt"

bamfile=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $1}'` 
bwfile=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $2}'`

echo $bamfile
echo $bwfile

bamCoverage -b $bamfile -o $bwfile