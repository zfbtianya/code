$map={}

ARGV.each{|fn|
  f = open("fn")
  line = f.gets.split("\t")
  contigname = line[2]
  readname = line[0]
  filename = fn
  read = line[9]
  if line.length==11 and contigname != %{*}
    if $map[contigname]
      if $map[contigname][filename]
        $map[contigname][filename]['reads'] << readname
        $map[contigname][filename]['length'] += read.length
      else
        $map[contigname][filename]={'reads' => [readname],'length'=>read.length}
      end
    else
      $map[contigname]={filename=>{'reads'=>[readname],'length'=>read.length}}
    end
  end
}
puts $map
