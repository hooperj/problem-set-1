#! /usr/bin/env bash 

datadir=~/bashClass/data-sets

#Which state in `states.tab.gz` has the lowest murder rate?
a1=$(zcat $datadir/misc/states.tab.gz |\
    sort -g -k 6|\
    head -2|\
    tail -n 1 | \
    cut -f 1 | \
    sed 's/\"//g')
echo 'answer-1:' $a1

#How many sequence records are in the `sample.fa` file?
a2=$(grep '>'  $datadir/fasta/sample.fa| wc -l)
echo 'answer-2:' $a2

#How many unique CpG IDs are in `cpg.bed.gz`?
a3=$(zcat $datadir/bed/cpg.bed.gz |\
    cut -f 4|\
    uniq |\
    wc -l)
echo 'answer-3:' $a3

#How many sequence records are in the `SP1.fq` file?
a4=$(grep :UMI_ $datadir/fastq/SP1.fq | wc -l)
echo 'answer-4:' $a4

#How many words are on lines containing the word `bloody` in `hamlet.txt`?
a5=$(for i in 1 2 3 4 5 6
        do
            grep -m $i bloody $datadir/misc/hamlet.txt| \
                tail -n 1 | wc -w
        done)
echo 'answer-5:' $a5

#What is the length of the sequence in the first record of `sample.fa`?
a6=$(grep -A 1 '>'  $datadir/fasta/sample.fa|\
  head -n 2| tail -n 1| tr -d '[:space:]' |wc -c)
echo 'answer-6:' $a6

#What is the name of the longest gene in `genes.hg19.bed.gz`?
a7=$(zcat $datadir/bed/genes.hg19.bed.gz|\
    awk 'BEGIN{OFS="\t"} {print $4, $3-$2}'| \
    sort -k 2 -nr| \
    head -1 | \
    cut -f 1)
echo 'answer-7:' $a7

#How many unique chromosomes are in `genes.hg19.bed.gz`?
a8=$(zcat $datadir/bed/genes.hg19.bed.gz | \
    cut -f 1| \
    uniq |\
    wc -l)
echo 'answer-8:' $a8

#How many intervals are associated with CTCF (**not** CTCFL) in
  #   `peaks.chr22.bed.gz`?
a9=$(zcat $datadir/bed/peaks.chr22.bed.gz | \
    grep CTCF$ | \
    wc -l)
echo 'answer-9:' $a9

#On what chromosome is the largest interval in `lamina.bed`?
a10=$(grep '\#' -v $datadir/bed/lamina.bed|\
    awk 'BEGIN{OFS="\t"} {print $1, $3-$2}'|\
    sort -k 2 -nr| \
    head -1 | \
    cut -f 1)
echo 'answer-10:' $a10

#for i in 1 2 3 4 5 6 7 8 9 10
 #   do
  #      answer='$a'$i
   #     echo 'answer-'$i':' $answer
    #done
    # seems like good idea but can't get teh variable inserted into a
    # variable
