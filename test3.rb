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

a = "112.124.667"
p a
p check(a)
=begin

String Challenge
Have the function StringChallenge(str) take the str parameter being passed 
and determine if it is a valid serial number with the following constraints:

1. It needs to contain three sets each with three digits (1 through 9) separated by a period.
2. The first set of digits must add up to an even number.
3. The second set of digits must add up to an odd number.
4. The last digit in each set must be larger than the two previous digits in the same set.

If all the above constraints are met within the string, the your program should return the string true,
 otherwise your program should return the string false. For example: if str is "224.315.218"
  then your program should return "true".
  
Examples
Input: "11.124.667"
Output: false
Input: "224.315.218" #"114.568.112" 
Output: true
=end