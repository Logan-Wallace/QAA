Lab Notebook for QAA 
--------------------
Logan Wallace
8/31/22
Bi622/3
-------

-------
Purpose
-------
The objectives of this assignment are to use existing tools for quality assessment and adaptor trimming, compare the 
quality assessments to those from your own software, and to demonstrate your ability to summarize other important information about this RNA-Seq data set.
In a smaller nutshell; compare our tools to existing tools and assess the quality of the data. 

----
Data
----
Data can be found here - /projects/bgmp/shared/2017_sequencing/demultiplexed/

A note that I am working with the files below - 
Logan   17_3E_fox_S13_L008      3_2B_control_S3_L008

------
PART 1
------

$module load fastqc 

$ fastqc 3_2B_control_S3_L008_R1_001.fastq.gz 3_2B_control_S3_L008_R2_001.fastq.gz 17_3E_fox_S13_L008_R1_001.fastq.gz 17_3E_fox_S13_L008_R2_001.fastq.gz -o /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/

Copied bioinfo.py to QAA directory

Note; downloaded the fastqc files to the Bi623 folder on my desktop

2. Running my quality score plotting script - using script batch script 'run_histogram.sh' (found in this repo).

Note: need to adjust my bioinfo module (populate_list function specifically) to read in gzipped files and passing 
"rt" instead of "r" as the read argument. 

Scripts run and posted to .rmd file!

------
PART 2
------
Create a conda environment 
conda create --name QAA

Note:

# To activate this environment, use
#
#     $ conda activate QAA
#
# To deactivate an active environment, use
#
#     $ conda deactivate


Get an interactive session - 
srun --account=bgmp --partition=bgmp --nodes=1 --ntasks-per-node=1 --time=4:00:00 --cpus-per-task=1 --pty bash

cutadapt --h
-A ADAPTER            3' adapter to be removed from R2
  -G ADAPTER            5' adapter to be removed from R2
cutadapt -a ADAPTER [options] [-o output.fastq] input.fastq
(paired end reads)
cutadapt -a ADAPT1 -A ADAPT2 [options] -o out1.fastq -p out2.fastq in1.fastq in2.fastq

My cut command for 3_2B_control_S3 files
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o 3_2B_control_S3_L008_R1_001_cut -p 3_2B_control_S3_L008_R2_001_cut /projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R2_001.fastq.gz

=== Summary ===

Total read pairs processed:          6,873,509
  Read 1 with adapter:                 219,477 (3.2%)
  Read 2 with adapter:                 268,119 (3.9%)
Pairs written (passing filters):     6,873,509 (100.0%)

Total basepairs processed: 1,388,448,818 bp
  Read 1:   694,224,409 bp
  Read 2:   694,224,409 bp
Total written (filtered):  1,384,906,999 bp (99.7%)
  Read 1:   692,563,098 bp
  Read 2:   692,343,901 bp

My cut command for 17_3E_fox_S13 files
cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -o 17_3E_fox_S13_L008_R1_001.fastq.gz_cut -p 17_3E_fox_S13_L008_R2_001.fastq.gz_cut /projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R1_001.fastq.gz /projects/bgmp/shared/2017_sequencing/demultiplexed/17_3E_fox_S13_L008_R2_001.fastq.gz

=== Summary ===

Total read pairs processed:         11,784,410
  Read 1 with adapter:               1,024,588 (8.7%)
  Read 2 with adapter:               1,104,503 (9.4%)
Pairs written (passing filters):    11,784,410 (100.0%)

Total basepairs processed: 2,380,450,820 bp
  Read 1: 1,190,225,410 bp
  Read 2: 1,190,225,410 bp
Total written (filtered):  2,335,751,295 bp (98.1%)
  Read 1: 1,168,027,279 bp
  Read 2: 1,167,724,016 bp

=== First read: Adapter 1 ===

Sequence: AGATCGGAAGAGCACACGTCTGAACTCCAGTCA; Type: regular 3'; Length: 33; Trimmed: 1024588 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 16.1%
  C: 29.9%
  G: 34.4%
  T: 13.1%
  none/other: 6.4%

Overview of removed sequences
length  count   expect  max.err error counts
3       225955  184131.4        0       225955
4       66666   46032.9 0       66666
5       35777   11508.2 0       35777
6       25568   2877.1  0       25568
7       24280   719.3   0       24280
8       23497   179.8   0       23497
9       23284   45.0    0       23009 275
10      23486   11.2    1       22633 853
11      22250   2.8     1       21493 757
12      22031   0.7     1       21267 764
13      21493   0.2     1       20780 713
14      20992   0.0     1       20277 715
15      20729   0.0     1       19970 759
16      20104   0.0     1       19316 788
17      19444   0.0     1       18610 834
18      18735   0.0     1       17954 761 20
19      17917   0.0     1       17041 840 36
20      17612   0.0     2       16716 789 107
21      16784   0.0     2       15947 745 92
22      16414   0.0     2       15556 749 109
23      16116   0.0     2       15207 805 104
24      15528   0.0     2       14709 716 103
25      15233   0.0     2       14396 735 102
26      14526   0.0     2       13654 772 100
27      13947   0.0     2       13057 770 110 10
28      13344   0.0     2       12519 718 95 12
29      12508   0.0     2       11698 695 104 11
30      12041   0.0     3       11191 707 105 38
31      11601   0.0     3       10771 714 84 32
32      10994   0.0     3       10186 650 104 54
33      10295   0.0     3       9573 584 105 33
34      9834    0.0     3       9170 543 92 29
35      9290    0.0     3       8657 527 76 30
36      8851    0.0     3       8263 477 88 23
37      8509    0.0     3       7954 478 61 16
38      8200    0.0     3       7673 443 57 27
39      7677    0.0     3       7192 412 45 28
40      7305    0.0     3       6858 392 45 10
41      6616    0.0     3       6218 344 38 16
42      6034    0.0     3       5664 325 38 7
43      5472    0.0     3       5140 284 35 13
44      4932    0.0     3       4638 266 23 5
45      4696    0.0     3       4393 273 24 6
46      4063    0.0     3       3826 202 29 6
47      3834    0.0     3       3607 191 24 12
48      3522    0.0     3       3326 164 25 7
49      3301    0.0     3       3076 190 28 7
50      3044    0.0     3       2873 154 14 3
51      2647    0.0     3       2492 133 19 3
52      2488    0.0     3       2350 117 14 7
53      2071    0.0     3       1937 111 14 9
54      1881    0.0     3       1783 84 11 3
55      1615    0.0     3       1525 75 14 1
56      1351    0.0     3       1279 65 6 1
57      1387    0.0     3       1306 73 8
58      1214    0.0     3       1143 65 2 4
59      1099    0.0     3       1032 55 11 1
60      1039    0.0     3       978 49 10 2
61      963     0.0     3       911 37 14 1
62      912     0.0     3       864 40 7 1
63      773     0.0     3       721 43 7 2
64      683     0.0     3       641 36 4 2
65      547     0.0     3       513 27 6 1
66      527     0.0     3       494 27 5 1
67      456     0.0     3       433 18 5
68      445     0.0     3       425 20
69      408     0.0     3       383 23 1 1
70      372     0.0     3       353 18 0 1
71      330     0.0     3       311 14 1 4
72      297     0.0     3       285 10 2
73      245     0.0     3       233 10 2
74      206     0.0     3       190 11 5
75      157     0.0     3       141 14 2
76      103     0.0     3       91 11 1
77      85      0.0     3       81 3 1
78      75      0.0     3       66 9
79      75      0.0     3       66 7 1 1
80      28      0.0     3       25 1 2
81      34      0.0     3       32 2
82      15      0.0     3       14 1
83      19      0.0     3       18 1
84      14      0.0     3       14
85      21      0.0     3       19 1 1
86      8       0.0     3       8
87      17      0.0     3       17
88      12      0.0     3       12
89      25      0.0     3       24 1
90      11      0.0     3       10 0 0 1
91      17      0.0     3       14 2 1
92      5       0.0     3       4 0 0 1
93      12      0.0     3       11 1
94      9       0.0     3       6 3
95      13      0.0     3       13
96      13      0.0     3       12 1
97      4       0.0     3       4
98      12      0.0     3       11 0 1
99      5       0.0     3       5
100     10      0.0     3       9 1
101     65502   0.0     3       6 58739 6317 440


=== Second read: Adapter 2 ===

Sequence: AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT; Type: regular 3'; Length: 33; Trimmed: 1104503 times

Minimum overlap: 3
No. of allowed errors:
1-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-33 bp: 3

Bases preceding removed adapters:
  A: 16.3%
  C: 32.8%
  G: 37.0%
  T: 7.9%
  none/other: 5.9%

Overview of removed sequences
length  count   expect  max.err error counts
3       287280  184131.4        0       287280
4       79052   46032.9 0       79052
5       37530   11508.2 0       37530
6       26927   2877.1  0       26927
7       24555   719.3   0       24555
8       23609   179.8   0       23609
9       23651   45.0    0       23225 426
10      23709   11.2    1       22832 877
11      22464   2.8     1       21739 725
12      22184   0.7     1       21611 573
13      21583   0.2     1       21051 532
14      21079   0.0     1       20572 507
15      20784   0.0     1       20143 641
16      20170   0.0     1       19626 544
17      19532   0.0     1       18908 624
18      18815   0.0     1       18062 746 7
19      17998   0.0     1       17386 599 13
20      17658   0.0     2       16908 669 81
21      16843   0.0     2       16105 657 81
22      16499   0.0     2       15813 622 64
23      16152   0.0     2       15491 578 83
24      15590   0.0     2       14847 663 80
25      15271   0.0     2       14511 663 97
26      14568   0.0     2       13851 622 95
27      14001   0.0     2       13356 540 103 2
28      13388   0.0     2       12746 553 85 4
29      12565   0.0     2       11905 564 88 8
30      12075   0.0     3       11447 536 69 23
31      11623   0.0     3       10739 743 108 33
32      11044   0.0     3       10417 493 108 26
33      10317   0.0     3       9727 473 78 39
34      9869    0.0     3       9297 451 85 36
35      9309    0.0     3       8797 424 65 23
36      8884    0.0     3       8408 384 61 31
37      8533    0.0     3       8029 408 62 34
38      8221    0.0     3       7735 375 66 45
39      7687    0.0     3       7255 339 65 28
40      7338    0.0     3       6925 324 60 29
41      6627    0.0     3       6298 259 38 32
42      6044    0.0     3       5720 261 42 21
43      5480    0.0     3       5196 235 26 23
44      4966    0.0     3       4700 210 36 20
45      4708    0.0     3       4444 220 28 16
46      4080    0.0     3       3892 155 24 9
47      3857    0.0     3       3650 166 20 21
48      3536    0.0     3       3332 175 21 8
49      3326    0.0     3       3154 128 26 18
50      3066    0.0     3       2890 143 25 8
51      2675    0.0     3       2514 128 20 13
52      2511    0.0     3       2380 104 21 6
53      2083    0.0     3       1971 89 13 10
54      1913    0.0     3       1803 85 11 14
55      1635    0.0     3       1506 102 18 9
56      1379    0.0     3       1292 71 11 5
57      1409    0.0     3       1317 68 17 7
58      1241    0.0     3       1168 59 10 4
59      1126    0.0     3       1043 62 13 8
60      1054    0.0     3       992 54 4 4
61      982     0.0     3       912 50 9 11
62      933     0.0     3       863 51 10 9
63      790     0.0     3       739 34 7 10
64      704     0.0     3       656 32 12 4
65      566     0.0     3       516 38 8 4
66      543     0.0     3       503 33 6 1
67      472     0.0     3       434 28 8 2
68      463     0.0     3       432 25 4 2
69      427     0.0     3       396 19 10 2
70      386     0.0     3       356 17 9 4
71      349     0.0     3       314 23 6 6
72      312     0.0     3       283 22 3 4
73      257     0.0     3       233 16 5 3
74      215     0.0     3       190 20 3 2
75      169     0.0     3       156 9 3 1
76      111     0.0     3       100 8 1 2
77      95      0.0     3       83 9 2 1
78      82      0.0     3       70 9 2 1
79      78      0.0     3       73 1 3 1
80      30      0.0     3       26 2 2
81      38      0.0     3       33 1 3 1
82      16      0.0     3       15 1
83      19      0.0     3       18 1
84      16      0.0     3       15 0 0 1
85      23      0.0     3       21 1 1
86      7       0.0     3       6 1
87      18      0.0     3       15 2 1
88      12      0.0     3       8 4
89      24      0.0     3       22 2
90      10      0.0     3       9 1
91      17      0.0     3       14 2 1
92      4       0.0     3       4
93      12      0.0     3       11 1
94      12      0.0     3       6 3 0 3
95      13      0.0     3       10 3
96      15      0.0     3       10 2 1 2
97      6       0.0     3       2 2 1 1
98      13      0.0     3       8 2 3
99      5       0.0     3       4 0 1
100     10      0.0     3       1 5 2 2
101     65176   0.0     3       6 58156 6462 552

Processing paired-end reads on 1 core ...
[         8<-] 00:00:19     1,890,000 reads @  10.5 µs/read;   5.71 M reads/minute

5.71 M reads per minute, hot dang

Use unix skills to search for adapter sequences - 

(QAA) [lwallac2@n278 QAA]$ zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R1_001.fastq.gz | grep 'AGATCGGAAGAGCACACGTCTGAACTCCAGTCA' | wc -l
7659
(QAA) [lwallac2@n278 QAA]$ zcat /projects/bgmp/shared/2017_sequencing/demultiplexed/3_2B_control_S3_L008_R1_001.fastq.gz | grep 'AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT' | wc -l
0

This output is good because I know that our read one and read two should not be sharing the same adapters 
and we found many R1 adapters in read one (7,659) and 0 in read2! 

trimmomatic --h

PE [-version] [-threads <threads>] [-phred33|-phred64] [-trimlog <trimLogFile>] [-summary <statsSummaryFile>] [-quiet] [-validatePairs] [-basein <inputBase> | <inputFile1> <inputFile2>] [-baseout <outputBase> | <outputFile1P> <outputFile1U> <outputFile2P> <outputFile2U>] <trimmer1>...

my trim command for 3_2B_control_S3_L008_R1_001_cut

trimmomatic PE -basein /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/3_2B_control_S3_L008_R1_001_cut -baseout 3_2B_control_S3_L008_R1_001_trim LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

my trim command for 17_3E_fox_S13_L008_R1_001_cut

trimmomatic PE -basein /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/17_3E_fox_S13_L008_R1_001_cut -baseout 17_3E_fox_S13_L008_R1_001_trim LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35

Manual for Trimmomatic - http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/TrimmomaticManual_V0.32.pdf

Note that output files have been named by automatically by trimmomatic by appending 1/2 and U/P. 
These mean read 1 or read 2 and paired(P) or unpaired(U).

7. For p7 I am going to write a python script to perform a line 
count on the files and add them to a dictionary from which I can plot 
the distribution of read lengths. The script is called 'length_distribution.py'.

That code is complete and can be found in this repo. 

---------------------------------------
PART 3 Alignment and strand-specificity
---------------------------------------

Installed all the below packages the the QAA environment
conda install - 
star bioconda/linux-64::star-2.7.10a-h9ee0642_0
numpy numpy-1.23.2 py310h53a5b5f_0
pysam pysam-0.19.1
matplotlib conda-forge/linux-64::matplotlib-3.5.3-py310hff52083_2
htseq bioconda/linux-64::htseq-2.0.2-py310ha14a713_0

#8 From ensembl, generate an alignment genome from ensembl release 107 using the mouse genome. 

GTF files can be found here - http://ftp.ensembl.org/pub/release-107/gtf/mus_musculus/
FASTA files can be found here - http://ftp.ensembl.org/pub/release-107/fasta/mus_musculus/dna/

Both files have been loaded into this repo. 

Running of STAR
The STAR manual can be found here - https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf

A. Generate a genome index using the mouse FASTA and GTF file. 

Hint; Make sure the files aren't zipped! gunzip <filename>

Wrote a batch script - STAR_genome_index.sh

B. Run a mapping job.

Wrote another batch script - 
STAR_mapping.sh

Successfully ran STAR genome index and alignment to both sets of files!

#9 Use PS8 script to report the number of mapped and unmapped reads from each of the 2 SAM files generated. 

$ cp /projects/bgmp/lwallac2/bioinfo/Bi621/PS/PS8/PS8.py ./

CONTROL - 
Mapped Counts: 13004729
Unmapped Counts: 497537

FOX - 
Mapped Counts: 22767404
Unmapped Counts: 950282

#10 Running htseq-count

My command for htseq-count

Note that we are going to have to run each file twice for a total of four htseq runs. 

htseq-count -s yes /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/STAR_ControlAligned.out.sam /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.107.gtf

(QAA) [lwallac2@n278 QAA]$ cat htseq_count_control | grep ^'ENSMUSG' | cut -f 2 | paste -sd+ | bc
245058

(QAA) [lwallac2@n278 QAA]$ cat htseq_count_control_rev | grep ^'ENSMUSG' | cut -f 2 | paste -sd+ | bc
5260739

htseq-count -s yes /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/STAR_FoxAligned.out.sam /projects/bgmp/lwallac2/bioinfo/Bi622/QAA/Mus_musculus.GRCm39.107.gtf > 

(QAA) [lwallac2@n278 QAA]$ cat htseq_fox_rev | grep ^'ENSMUSG' | cut -f 2 | paste -sd+ | bc
8952669
(QAA) [lwallac2@n278 QAA]$ cat htseq_fox_yes | grep ^'ENSMUSG' | cut -f 2 | paste -sd+ | bc
443307

#11
Leslie talking about #11; 
Stranded = 'No' - Same or opposite strand at feature
Stranded = 'Yes' - Paired, 1st on same strand, 2nd on opposite strand. 
Stranded = 'Reu' - The rules for 'Yes' are reversed. 
If we see that the rates of Yes and Rev are significantly different we can infer that the library prep was stranded. 

From the above counts we can infer that we indeed had a stranded library prep. 

