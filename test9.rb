def StringChallange2(str)
  return 'false' if str.include? "password"
    if str =~ /^(?=.*[A-Z])(?=.*[0-9])(?=.*[[:punct:]]).*$/ && str.length > 7 && str.length < 31 
        'true' 
      else 
        'false'
    end  
end
  str = "p!A2p!A2p!passwort"
  puts StringChallange2(str)