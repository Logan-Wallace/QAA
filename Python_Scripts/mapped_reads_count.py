#! usr/bin/env python

'''The purpose of this script is to iterate through an htseq count file and sum'''

input = "htseq_count_control"

mapped_sum = 0
 
with open(input, "r") as input1:
    for line in input1:
        line = line.strip()
        lines = line.split()
        print(lines)
        mapped_sum += int(lines[1])
print("The total reads mapped to features is: ", mapped_sum)


