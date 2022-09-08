#PS8.py
#!usr/bin/env python

mapped_count: int = 0
unmapped_count: int = 0

file: str = "STAR_FoxAligned.out.sam"

with open(file, 'r') as file:
    for line in file:
        if line[0] != '@':
            lst = line.split("\t")
            flag = int(lst[1])
            if((flag and 256) == 256):
                if((flag & 4) == 4):
                    unmapped_count += 1
                else:
                    mapped = False
                    mapped_count += 1

print("Mapped Counts: " + str(mapped_count))
print("Unmapped Counts: " + str(unmapped_count))

percent_mapped = mapped_count / (mapped_count + unmapped_count)
percent_unmapped = unmapped_count / (mapped_count + unmapped_count)

print("Percent Mapped: " + percent_mapped)
print("Percent Mapped: " + percent_unmapped)

