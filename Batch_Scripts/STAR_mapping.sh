#!/usr/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=LW_STAR_MAP
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --output=LW_STAR_MAP

/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 \
--alignMatesGapMax 1000000 \
--readFilesIn /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/17_3E_fox_S13_L008_R1_001_trim_1P /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/17_3E_fox_S13_L008_R1_001_trim_2P \
--genomeDir /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.107.dna.STAR.2.7.10a \
--outFileNamePrefix /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/STAR_Fox