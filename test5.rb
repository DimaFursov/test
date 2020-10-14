=begin Difficult medium. Have the function StringChallenge(str) take the str parameter being passed and determine if it passes as a valid password 
that follows the list of constraints: 
1. It must have a capital letter.
2. It must contain at least one numder
3. It must contain a punctuation mark
4. It cannot have the word "password" in the string
5. It must be longer then 7 characters and shorter then 31 characters
If all the above constraints are met within the string, the your program should return the string true, otherwise your program
should return the string false. For exemple: if str is "apple!M7" then your program should return "true"
input: "turkey90AAA="
Output: true
=end
def Sa(str)
  p x = "str:  #{str}"
  p x = "/\d/.match(str):  #{/\d/.match(str)}"
  p "str.scan(/(passwor.)/):  #{x = str.scan(/(passwor.)/)}"
  p "str.scan(/passwor./):  #{x = str.scan(/passwor./)}"
  p "str.scan(/passwor/):  #{x = str.scan(/passwor/)}"
  p "x = str.include? :  #{x = str.include? "password"}"
  p "x = str.match :  #{x = str.match("passwor")}"
  
  
  
   #/password/i =~ /bcd/i  # evaluates as true
   #/[[:punct:]]/
   # ((?!password).)*  # ^(?!password).*$
  regex = /\A\d+password\z/i
  #,\s* # Необязательно: запятая и т. д. +[A-Z]
  # ? не жадный
  if str =~ /[[:punct:]]*\d*[A-Z]*password/
  puts "* 0 или более повторений предыдущего подвыражения str =~/[[:punct:]]*\d*[A-Z]*/"
  end
  if str =~ /[.]/
  puts "[] произвольный набор символов "
  end
  if str =~ /\d/
  puts "regex /'\d'/  str =~ /\d/"
  end
  return 'false' if str.include? "password"
  
  if /[[:punct:]]*\d*[A-Z]*/.match(str) && str.length > 7 && str.length < 31 
      return 'true' 
    else 'false'
  end  
end
str = "M,passwordM!.1"
puts Sa(str)
p "----------------------done----------------------------------------"
def StringChallange2(str)
  return 'false' if str.include? "password"
    if str =~ /^(?=.*[A-Z])(?=.*[0-9])(?=.*[[:punct:]]).*$/ && str.length > 7 && str.length < 31 
        return 'true' 
      else 'false'
    end  
end
  str = "p!A2p!A2p!passwort"
  puts StringChallange2(str)

p "_______________________________________________________________________"
def StringChallange3(str)
  #return 'false' if str.include? "password"
  #.{8,31}$
  #[0-9] \d
  #/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/
  #\d{1,3}
  #/[A-Z]\d*[[:punct:]]*/
  #/^[A-Z\d]$/
  #|^[0-9]*$|
  #^(?=.*[A-Z])(?=.*[\d])(?=.*[[:punct:]])(?=.*[d])(?=.*[e]).*$
  #^(?=.*[A-Z])(?=.*[\d])(?=.*[[:punct:]]).*$
  #^(?=.*[A-Z])(?=.*[0-9])(?=.*[[:punct:]]).*$
  #/[[:punct:]]/.match(str) && /\d/.match(str) && /[A-Z]/.match(str)
  #(?!.password)
  #/^(?=.*[A-Z])(?=.*[0-9])(?=.*[[:punct:]]).*$/.match(str)
  #/^(?:(?=.*[a])(?:(?=.*[b])(?=.*(?:[c]|[d]|[e]))
  #|(?=.*[c])(?=.*(?:[d]|[e])))|(?=.*[d])(?=.*[e])
  #|(?=.*[b])(?:(?=.*[c])(?=.*[d])|(?=.*([c]|[d]))(?=.*[e]))|(?=.*[c])(?=.*[d])(?=.*[e])).*$/gm
  # ^(?! [Symphony])$
  #/^(?=.*[0-9])|(?! Symphony).*$/
      if str =~ /Symphony/# && str.length > 7 && str.length < 31 
          return 'true' 
        else 'false'
      end  
end
  str = "Symphoy"
  #str = "p!A2p!A2p!passwort"
  #str = "AqwertqwertqwertqwertqwertA,"
  puts StringChallange3(str)


=begin
String Challenge
Have the function StringChallenge(str) take the str parameter being passed and determine if it passes as a valid password that follows the list of constraints:

1. It must have a capital letter.
2. It must contain at least one number.
3. It must contain a punctuation mark.
4. It cannot have the word "password" in the string.
5. It must be longer than 7 characters and shorter than 31 characters.

If all the above constraints are met within the string, the your program should return the string true, otherwise your program should return the string false. For example: if str is "apple!M7" then your program should return "true".
Examples
Input: "passWord123!!!!"
Output: false
Input: "turkey90AAA="
Output: true
=end
