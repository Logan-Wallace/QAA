#!/bin/bash
#SBATCH --account=bgmp                 
#SBATCH --partition=bgmp               
#SBATCH --job-name=Histogram_LW                           
#SBATCH --nodes=1                      
#SBATCH --cpus-per-task=8


#python demultiplex_histogram.py -f "/projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R1_001.fastq.gz" -o "3_2B_control_S3_L008_R1_001.hist"
#python demultiplex_histogram.py -f "/projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R2_001.fastq.gz" -o "3_2B_control_S3_L008_R2_001.hist"
#python demultiplex_histogram.py -f "/projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R1_001.fastq.gz" -o "17_3E_fox_S13_L008_R1_001.hist"
python demultiplex_histogram.py -f "/projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R2_001.fastq.gz" -o "17_3E_fox_S13_L008_R2_001.hist"