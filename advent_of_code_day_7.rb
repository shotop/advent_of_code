require 'pry'

#prob 1
@input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/day_7_input.txt", chomp: true)

def parse_parent_from(rule)
  rule.split.first(2).join(" ")
end


@colors = ["shiny gold"]
@parents = []

def process(current_colors)
  current = []

  current_colors.each do |color|
    current << @input.select do |rule|
      rule.include?(color) && !rule.start_with?(color)
    end
  end

  @parents << current.flatten

  if @parents.last.any?
    @colors = @parents.last.map {|parent| parse_parent_from(parent) }
    process(@colors)
  else
    puts @parents.flatten.uniq.count
  end
end

process(@colors)
#115

