#!/bin/bash

# 1st parameter: FASTQ
# 2nd parameter: Path to bowtie reference genome

bowtie -S -p 2 --chunkmbs 512 -k 1 -m 1 -v 2 --best --strata \
       $2 <(fastx_trimmer -Q 33 -l 50 -i <(zcat $1)) | samtools view -Sb -F 4 -o `basename $1 fastq.gz`bam -
  
