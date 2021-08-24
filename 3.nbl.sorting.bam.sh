#! /bin/bash
#$ -cwd

#SBATCH -c 6
#SBATCH -t 24:00:00 
#SBATCH --mem=50GB 
#SBATCH -a 1-3

samplesheet="/mnt/isilon/diskin_lab/rawan/slurm/chip-seq_processing/bwa.align/nbl_chipseq/maris/sorting.bam.txt"

threads=$SLURM_JOB_CPUS_PER_NODE

input=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $1}'` 
output=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $2}'`

sambamba sort -t $threads -o $output $input