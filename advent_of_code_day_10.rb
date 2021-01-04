require 'pry'

#prob 1
input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/day_10_input.txt", chomp: true).map(&:to_i)

difference_of_one_count = 0
difference_of_three_count = 0
current_jolt = 0

input.sort.each do |adapter|
  difference_of_one_count += 1 if adapter - current_jolt == 1
  difference_of_three_count += 1 if adapter - current_jolt == 3

  current_jolt = adapter
end

#add 1 more to the three count for the built in adapter
difference_of_three_count += 1

puts difference_of_one_count * difference_of_three_count

