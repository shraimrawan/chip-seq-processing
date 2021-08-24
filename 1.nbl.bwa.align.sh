#! /bin/bash
#$ -cwd

#SBATCH -c 10
#SBATCH -t 48:00:00 
#SBATCH --mem=80GB 
#SBATCH -a 1-3

module load BWA/0.7.17-GCC-9.3.0

samplesheet="nbl.maris.txt"

threads=$SLURM_JOB_CPUS_PER_NODE

##Fastq file to sam file using bwa

r1=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet | awk '{print $1}'` # zipped r1

#r2=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet | awk '{print $2}'` # zipped r2

r1q=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet | awk '{print $2}'` #unzipped r1

#r2q=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet | awk '{print $4}'` #unzipped r2

output=`sed -n "$SLURM_ARRAY_TASK_ID"p $samplesheet | awk '{print $3}'` #aligned file 

if [ ! -e $r1q ]
then 
	gunzip $r1
	#gunzip $r2
fi


wait 
bwa mem -M -t $threads /mnt/isilon/maris_lab/target_nbl_ngs/shared_resources/bwa_index_files/bwa_index_0.7.12/hg19.fa $r1q >$output
