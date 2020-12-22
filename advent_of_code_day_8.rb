require 'pry'

#prob 1
@input = File.readlines("/Users/shotop/Coding/Advent_Of_Code_2020/day_8_input.txt", chomp: true)

@instructions = @input.map do |inst|
  inst.split.append(false)
end

index = 0
acc = 0

while index < @instructions.length
  inst = @instructions[index]
  bool = inst.last
  operation = inst.first
  arg = inst[1]

  if bool
    puts acc
    break
  end

  case operation
  when "nop"
    inst.replace([operation, arg, true])
    index = index + 1
  when "acc"
    inst.replace([operation, arg, true])
    acc += arg.to_i
    index = index + 1
  when "jmp"
    inst.replace([operation, arg, true])
    index = index + arg.to_i
  end
end



