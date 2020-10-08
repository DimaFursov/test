require 'active_support'
require 'active_support/core_ext'
def check(str)
  arr = str.split('.')
  return 'false' if arr.size != 3

  arr.each_with_index do |num_str, idx|

    num_arr = num_str.split('')
    return 'false' if num_arr.size != 3
    return 'false' if idx == 0 && (num_arr.map(&:to_i).sum % 2) != 0
    return 'false' if idx == 1 && (num_arr.map(&:to_i).sum % 2) == 0
    return 'false' if num_arr[-1].to_i <= num_arr[0].to_i || num_arr[-1].to_i <= num_arr[1].to_i

    num_arr.each do |num|
      return 'false' unless num.to_i.in?([1,2,3,4,5,6,7,8,9])
    end

  end
  return 'true'
end

a = "11.124.667"
p a
p check(a)
=begin
"224.315.218" #"114.568.112" #"11.124.667"

=end