require 'pry'

#prob 1
input = File.read("/Users/shotop/Coding/Advent_Of_Code_2020/day_4_input.txt").split("\n\n")

REQUIRED_FIELDS = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

res = input.select do |passport|
  REQUIRED_FIELDS.all? {|field| passport.include? field}
end

p res.count
