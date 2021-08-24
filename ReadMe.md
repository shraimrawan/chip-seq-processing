CHIP-seq processing pipeline 

by: Rawan Shraim 

Uses Hg19 for alignment - please update to Hg38 if needed 

## 1. nbl.bwa.align.sh
### This script will align the chip seq data using bwa. All info is fed into script through a text file inserted in the "samplesheet" file.
### Option for paired-end vs single-end data available - remove commented out r2 and r2q if you have paired end data 
### Output is sam file 

## 2. sam.bam.sh

### converting sam file to bam file 

## 3. nbl.sorting.bam.sh

### sorting bam file by genomic coordinates 

## 4. filter.unique.sh 

### filter bam file to only have uniquely mapped reads 

## 5. blackreagions.sh

### filter out blackregions in bam file 

## For MACS you can either look at peaks with creating a model or not. I have scripts for both options 

## 6. mac2.peakcall.sh 

### no model peak calling 

## 7. macs2.peaks.model.sh

### peak calling when prompting MACS to create a model 

## 8. bigwig.sh 

### create bigwig file to visualize in IGV-tools 

