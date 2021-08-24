#! /bin/bash
#$ -cwd

#SBATCH -c 8
#SBATCH -t 35:00:00 
#SBATCH --mem=50GB 
#SBATCH -a 1-2

samplesheet="/mnt/isilon/diskin_lab/rawan/slurm/chip-seq_processing/bwa.align/nbl_chipseq/maris/macs2.txt"


input1=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $1}'` 
#input2=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $2}'` 
chip=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $2}'`
name=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet |  awk '{print $3}'`



macs2 callpeak -t $chip \
	-c $input1 \
 	-f BAM -g 1.3e+8 \
	-n $name \
	--outdir /mnt/isilon/diskin_lab/rawan/slurm/chip-seq_processing/bwa.align/nbl_chipseq/maris/macsresult