require 'pry'

#prob 1
@input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/day_9_input.txt", chomp: true).map(&:to_i)

@input.each_with_index do |number, index|
  next unless index >= 25

  preamble = @input.slice(index - 25, 25)

  if preamble.combination(2).detect { |a, b| a + b == number }.nil?
    puts number
  end
end
