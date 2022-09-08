#! usr/bin/env python

'''The purpose of this script is to read in a series of fastq files and return a 
graphical output of the read length distribution'''

import matplotlib.pyplot as plt

#Initialize some variables
input1: str = "3_2B_control_S3_R1_trim_paired.fastq"
input3: str = "3_2B_control_S3_R2_trim_paired.fastq"
read_length_dict_R1: dict = {}
read_length_dict_R2: dict = {}
lcount = 0

#initialize a dictionary for read lengths up to 101
for x in range(102):
    read_length_dict_R1[x] = 0
    #Open up the fastq files
with open(input1) as in1:
    for line in in1:
        line = line.strip()
        if lcount % 4 == 1:
            read_length = len(line)
            read_length_dict_R1[read_length] += 1
        lcount += 1

lcount = 0 

for x in range(102):
    read_length_dict_R2[x] = 0
    #Open up the fastq files
with open(input3) as in3:
    for line in in3:
        line = line.strip()
        if lcount % 4 == 1:
            read_length = len(line)
            read_length_dict_R2[read_length] += 1
        lcount += 1

#Plot the results from our list as a histogram
plt.bar(list(read_length_dict_R1.keys()), read_length_dict_R1.values())
plt.xlabel("Read Position")
plt.ylabel("Frequency")
plt.title("Read Length Distribution by Read Position")
plt.savefig(input1 + ".png")

plt.bar(list(read_length_dict_R2.keys()), read_length_dict_R2.values())
plt.xlabel("Read Position")
plt.ylabel("Frequency")
plt.title("Read Length Distribution by Read Position")
plt.savefig(input3 + ".png") 
