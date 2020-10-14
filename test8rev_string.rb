a = [1,5,3,1,6,7,2] 
puts a
puts "_________________"
a = [1,5,3,1,6,7,2] 
i =0
size = a.length - 1
while i < a.length do
    for i in 0...size
      a_i = a[i]
      a[i] = a[i+1]
      a[i+1] = a_i
    end
    size -= 1
  i += 1
end
puts a