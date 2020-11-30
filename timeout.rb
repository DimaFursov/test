require 'timeout.rb'
flag = false
answer = nil
#answer = "cookie"
# XD XD XD
begin
 timeout(15) do
 puts "Хочу печенье!"
 answer = gets.chomp
 flag = true
 end
rescue TimeoutError
 flag = false
end
if flag
 if answer == "cookie"
 puts "Спасибо! Хрум, хрум..."
 else
 puts "Это же не печенье!"
 exit
 end
else
 puts "Эй, слишком медленно!"
 exit
end
puts "До встречи..."