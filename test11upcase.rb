p s = 'foo bar vaz'
i = 0
s = s.split(' ').each{|w|
  p w[0].upcase!
  
}.join
p s