require 'pry'

#prob 1
input = File.read("/Users/shotop/Coding/Advent_Of_Code_2020/day_6_input.txt").split("\n\n")

counts = input.map do |answers|
  answers.delete("\n").chars.uniq.count
end

p counts.inject(:+)


#prob 2
input = File.read("/Users/shotop/Coding/Advent_Of_Code_2020/day_6_input.txt").split("\n\n")

@count = 0

input.map do |group_answers|
  individual_answers = group_answers.split("\n")

  if individual_answers.count == 1
    @count += individual_answers.first.chars.count
  else
    @count += individual_answers.map(&:chars).inject {|a,e| a & e}.count
  end
end

