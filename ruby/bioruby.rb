require 'bio'
seq = Bio::Sequence::NA.new("atgcatgcaaaa")
seq.complement
seq.subseq(3,8)
seq.gc_percent
seq.composition
seq.translate
seq.translate(2)
seq.translate.codes
seq.translate.names
seq.translate.composition
seq.translate.molecular_weight
counts = {'a'=>seq.count('a'),'c'=>seq.count('c'),'g'=>seq.count('g'),'t'=>seq.count('t')}
randomseq = Bio::Sequence.NA.randomize(counts)

seq = Bio::Sequence::NA.new("atgcatgcaattaagctaatcccaattagatcatcccgatcatcaaaaaaaaaa")
a = [];seq.window_search(20){ |s| a.push s.gc_percent }
seq.window_search(15,3){ |s| a.push s.translate }

i = 1
textwidth = 60
remainder = seq.window_search(10000,9000) do |s|
  puts s.to_fasta("segment #{i}", textwidth)
  i += 1
end
if remainder
  puts remainder.to_fasta("segment #{i}", textwidth)
end

codon_usage = Hash.new(0)
seq.window_search(3,3){ |s| codon_usage[s] += 1 }

a = []
seq.window_search(10,10) { |s| a.push s.molecular_weight }

input_seq = ARGF.read
my_naseq = Bio::Sequence::NA.new(input_seq)
my_aaseq = my_naseq.translate

ff = Bio::FlatFile.new(Bio::GenBank, ARGF)
ff.each_entry do |gb|
  definition = "#{gb.accesssion} #{gb.definition}"
  puts gb.naseq.to_fasta(definition,60)
end

ff = Bio::FlatFile.new(Bio::FastaFormat, ARGF)
ff.each_entry do |f|
  puts "definition : " + f.definition
  puts "nalen      : " + f.nalen.to_s
  puts "naseq      : " + f.naseq
end

ff = Bio::GenBank.open("gbvrl1.seq")
ff.each_entry do |gb|
  definition = "#{gb.accession} #{gb.definition}"
  puts gb.naseq.to_fasta(definition, 60)
end

ff = Bio::FlatFile.new(Bio::GenBank, ARGF)

ff.each_entry do |gb|
  puts "#{gb.accession} - #{gb.organism}"
  gb.features.each do |feature|
    position = feature.position
    hash = feature.assoc
    next unless hash['translation']
    gene_info = [
                 hash['gene'], hash['product'], hash['note'],hash['function']
                ].compact.join(', ')
    puts ">NA splicing('#{position}') : #{gene_info}"
    puts gb.naseq.splicing(position)
    puts ">AA translated by splicing('#{position}').translate"
    puts gb.naseq.splicing(position).translate
    puts ">AA original translation"
    puts hash['translation']
  end
end
ff = Bio::FlatFile.auto(ARGF)
ff.each_entry do |entry|
  p entry.entry_id
  p entry.definition
  p entry.seq
end
