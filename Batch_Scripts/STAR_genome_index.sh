#!/usr/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=LW_STAR
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --output=LW_STAR

/usr/bin/time -v /projects/bgmp/lwallac2/miniconda3/envs/bgmp_py310/bin/STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.107.dna.STAR.2.7.10a \
--genomeFastaFiles /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.107.gtf \

