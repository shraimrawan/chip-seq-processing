#! /bin/bash
#$ -cwd

#SBATCH -c 5
#SBATCH -t 24:00:00 
#SBATCH --mem=40GB 
#SBATCH -a 1-3

samplesheet="/mnt/isilon/diskin_lab/rawan/slurm/chip-seq_processing/bwa.align/nbl_chipseq/maris/blackregion.txt"

module load BEDTools/

input=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $1}'` 
output=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $2}'`

bedtools intersect -v -abam $input -b /mnt/isilon/diskin_lab/rawan/slurm/chip-seq_processing/bwa.align/reference/hg19-blacklist.v2.bed > $output

