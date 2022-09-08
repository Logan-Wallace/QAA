#!/bin/bash
#SBATCH --account=bgmp                 
#SBATCH --partition=bgmp               
#SBATCH --job-name=htseq_fox_rev                           
#SBATCH --nodes=1                      
#SBATCH --cpus-per-task=8

htseq-count -s yes /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/STAR_FoxAligned.out.sam /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.107.gtf > htseq_fox_yes