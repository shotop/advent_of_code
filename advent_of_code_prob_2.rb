require 'pry'

input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/advent_of_code_2.txt", chomp: true)

#prob 1
res = input.map(&:split).select do |policy|
  count_range = policy.first.split("-").map(&:to_i)
  char = policy[1].delete(":")
  password = policy.last

  password.count(char).between?(count_range.first, count_range.last)
end

puts res.count


#prob 2
res = input.map(&:split).select do |policy|
  indexes = policy.first.split("-").map(&:to_i)
  char = policy[1].delete(":")
  password = policy.last

  next unless password.include?(char)

  char_at_pos = []
  char_at_pos.append(password[indexes.first - 1] == char)
  char_at_pos.append(password[indexes.last - 1] == char)

  char_at_pos.count(true) == 1
end

puts res.count


