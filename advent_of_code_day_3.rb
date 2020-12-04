require 'pry'

input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/day_3_input.txt", chomp: true)

index = 0
trees = 0

input.each do |line|
  while index > line.length do
    line = line.concat(line)
  end

  trees += 1 if line[index] == "#"
  index += 3
end

p trees
