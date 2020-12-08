require 'pry'

#prob 1
input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/day_5_input.txt", chomp: true)

def determine_row(row_code)
  rows = (0..127).to_a

  while rows.count > 2 do
    row_code.chars.each do |char|
      char == "F" ? rows = rows[0..rows.count / 2 - 1] : rows = rows[rows.count / 2..-1]
    end
  end

  rows.first
end

def determine_column(column_code)
  columns = (0..7).to_a

  while columns.count > 2 do
    column_code.chars.each do |char|
      char == "L" ? columns = columns[0..columns.count / 2 - 1] : columns = columns[columns.count / 2..-1]
    end
  end

  columns.first
end

seat_ids = input.map do |seat_code|
  row = determine_row(seat_code[0...7])
  column = determine_column(seat_code[-3..-1])

  row * 8 + column
end

p seat_ids.max
