require 'pry'

input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/advent_of_code_2.txt", chomp: true)

res = input.map(&:split).select do |policy|
  count_range = policy.first.split("-").map(&:to_i)
  char = policy[1].delete(":")
  password = policy.last

  password.count(char).between?(count_range.first, count_range.last)
end

puts res.count
