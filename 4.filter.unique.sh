#! /bin/bash
#$ -cwd

#SBATCH -c 5
#SBATCH -t 24:00:00 
#SBATCH --mem=40GB 
#SBATCH -a 1-3

samplesheet="/mnt/isilon/diskin_lab/rawan/slurm/chip-seq_processing/bwa.align/nbl_chipseq/maris/unique.txt"

input=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $1}'` 
output=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $2}'`

sambamba view -h -t 2 -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" $input > $output