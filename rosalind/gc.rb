$dna_strings = {}

def read
  current_tag = ""
  while t = gets
    t.chomp!
    if t[0] == '>' # tag
      current_tag = t[1..-1]
      $dna_strings[current_tag] = ""
      next
    end
    $dna_strings[current_tag] += t
  end
end

def gc_count dna
  dna.gsub(/[A|T]/,"").size
end

def best
  best = -1
  tag = ""
  $dna_strings.each do |key, value|
    t = (1.0 * gc_count(value)) / value.size
    if t > best
      best = t
      tag = key
    end
  end
  [tag, best]
end

read
t, p = best
puts t
puts "#{p*100}%"
