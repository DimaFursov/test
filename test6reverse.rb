#p "перевернуть #{a = [1,5,3,1,6,7,2] }"
p a = '1531672'
i = 0

p size = a.length - 1
size -= 1
p size
size -= 1
p size
size -= 1
p size
size -= 1
p size
size -= 1
p size
size -= 1
p size
while i < a.length do
    for i in 0...size
      a_i = a[i]
      a[i] = a[i+1]
      a[i+1] = a_i
    end
    size -= 1
  i += 1
end
#puts a
p a