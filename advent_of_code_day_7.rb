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
115

# prob 2
# @input = ["shiny gold bags contain 2 dark red bags.",
# "dark red bags contain 2 dark orange bags.",
# "dark orange bags contain 2 dark yellow bags.",
# "dark yellow bags contain 2 dark green bags.",
# "dark green bags contain 2 dark blue bags.",
# "dark blue bags contain 2 dark violet bags.",
# "dark violet bags contain no other bags."]

# 2 + 2*2 + 4*2 + 8*2 + 16*2 + 32*2
# => 126

def parse_child_counts(line)
  child_hash = {}
  split_line = line.split
  split_line.each.with_index do |item, index|
    if item.to_i > 0
      child = split_line[index..index + 2].last(2).join(" ").delete(".")
      child_hash[child] = item.to_i
    end
  end
  child_hash
end

data = {}

@input.map do |rule|
  parent = rule.split.first(2).join(" ")
  children_with_counts = parse_child_counts(rule)
  data[parent] = children_with_counts
end

def process(data, color)
  return 1 if data[color].empty?

  data[color].sum do |k, v|
    inside = process(data, k)

    inside > 1 ? v.to_i + (v.to_i * inside) : v.to_i
  end
end

p process(data, "shiny gold")
1250
