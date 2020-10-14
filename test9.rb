def StringChallange2(str)
  #return 'false' if str.include? "password"
  #return 'false' if str.include? "PASSWORD"
  return 'false' if str =~ /password/i
  if str =~ /^(?=.*[A-Z])(?=.*[0-9])(?=.*[[:punct:]]).*$/ && str.length > 7 && str.length < 31 
      'true' 
    else 
      'false'  
  end   
end
  str = "passWord123!!!!"
  #Output: false

  puts StringChallange2(str)

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