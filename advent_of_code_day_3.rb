require 'pry'

input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/day_3_input.txt", chomp: true)

#part 1
index = 0
trees = 0

input.each do |line|
  while index > line.length do
    line = line.concat(line)
  end

  trees += 1 if line[index] == "#"
  index += 1
end

p trees


#part 2
slopes = [[1,1],[3,1],[5,1],[7,1],[1,2]]

slope_multiple = 1

slopes.each do |slope|
  index = 0
  trees = 0

  input.each_slice(slope.last) do |slice|
    line = slice.first

    while index >= line.length do
      line = line.concat(line)
    end

    trees += 1 if line[index] == "#"
    index += slope.first
  end

  slope_multiple *= trees
end

p slope_multiple
