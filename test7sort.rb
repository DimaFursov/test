i = 1
p a = [1,5,3,1,6,7,2] 
size = a.length - 1
while i < a.length do
  for i in 0...size
    p "a[i] #{a[i]}"
    p "a[i+1] #{a[i+1]}"
  a[i], a[i+1] = a[i + 1], a[i] if a[i] > a[i + 1]
  #if a[i] > a[i + 1] then
  #a_l = a[i + 1]
  #a[i+1] = a[i]
  #a[i] = a_l
  #end
  end
  size -= 1
  p "size #{size}"
  i += 1
  p "i: #{i}"
end
p "___________________"
p a