#step1
awk 'ARGIND==1{a[$1]=$2}ARGIND==2{if(/>/){gsub(/>/,"",$1);print ">"$1"|"a[$1]}else{print "AAACCC"$0}}' meta.groups meta.fasta >cdhit.fasta

cdhit-otu.pl -i cdhit.fasta -o process -p 0 -f 0.3 -u 0 -c 0.97

clstr2list.pl -i OTU.nr2nd.clstr -l 0.03

#longtime,step2
blastn -query meta.unique.fasta -db its  -out meta.blast-its.xls -evalue 1e-5 -max_target_seqs  1  -outfmt 5 -num_threads 20

#step3
gi2tax_mothur.pl -i meta.unique.blast-its.xls -t tab -d n -o meta.unique.blast-its.taxonomy.temp

cp meta.names meta.unique.blast-its.taxonomy.temp process/

cd process;awk 'ARGIND==1{a[$1]=$2}ARGIND==2{if(a[$1]){print $1"\t"a[$1]}else{print $1"\tunclassified;"}}' meta.unique.blast-its.taxonomy.temp ../meta.names  >meta.unique.blast-its.taxonomy;cd ..

pipe-otutax.pl -s 7 -list OTU.nr2nd.clstr.list -tax meta.unique.blast-its.taxonomy -gp clstr.groups -na meta.names
