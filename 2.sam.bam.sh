#! /bin/bash
#$ -cwd

#SBATCH -c 6
#SBATCH -t 24:00:00 
#SBATCH --mem=50GB 
#SBATCH -a 1-3

module load sam-bcf-tools/1.6

samplesheet="/mnt/isilon/diskin_lab/rawan/slurm/chip-seq_processing/bwa.align/nbl_chipseq/maris/sam.txt"


input=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $1}'` 
output=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $2}'`


samtools view -h -S -b -o $output $input

