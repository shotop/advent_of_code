require 'pry'

#prob 1
input = File.read("/Users/shotop/Coding/Advent_Of_Code_2020/day_4_input.txt").split("\n\n")

REQUIRED_FIELDS = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

res = input.select do |passport|
  REQUIRED_FIELDS.all? {|field| passport.include? field}
end

p res.count



#prob 2
input = File.read("/Users/shotop/Coding/Advent_Of_Code_2020/day_4_input.txt").split("\n\n")

REQUIRED_FIELDS = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

complete_passports = input.select do |passport|
  REQUIRED_FIELDS.all? {|field| passport.include? field}
end

complete_passports.map! {|pass| pass.gsub("\n", " ").split(" ")}

passport_hashes = []

complete_passports.each do |passport|
  passport_hash = {}
  passport.each do |field|
    keys_values = field.split(":")
    passport_hash[keys_values.first] = keys_values.last
  end
  passport_hashes << passport_hash
end

def validate_height(height)
  (height.include?("cm") && height[0..-3].to_i.between?(150,193)) ||
  (height.include?("in") && height[0..-3].to_i.between?(59,76))
end

def validate_hair_color(hair_color)
  /^\#[0-9a-f]{6}$/.match?(hair_color)
end

def validate_eye_color(eye_color)
  ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].one? { |color| color == eye_color }
end

def validate_passport_id(passport_id)
  passport_id_chars = passport_id.chars
  passport_id_chars.count == 9 &&
  passport_id_chars.all? { |char| Integer(char) rescue false }
end

valid_passports = passport_hashes.select do |passport_hash|
  passport_hash["byr"].to_i.between?(1920, 2002) &&
  passport_hash["iyr"].to_i.between?(2010, 2020) &&
  passport_hash["eyr"].to_i.between?(2020, 2030) &&
  validate_height(passport_hash["hgt"]) &&
  validate_hair_color(passport_hash["hcl"]) &&
  validate_eye_color(passport_hash["ecl"]) &&
  validate_passport_id(passport_hash["pid"])
end

puts valid_passports.count




