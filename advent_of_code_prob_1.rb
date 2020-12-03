require 'pry'

input = File.read("/Users/shotop/Downloads/number.txt").lines.map(&:to_i)

res = input.combination(3).select do |x,y,z|
  x + y + z == 2020
end

puts res.first.inject(:*)
