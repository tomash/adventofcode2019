
# Part One

def run_intcode(initial_intcode)
  intcode = initial_intcode.clone

  current_position = 0
  while(true)
    current_opcode = intcode[current_position]

    if current_opcode == 1 # sum
      comp1_position = intcode[current_position+1]
      comp2_position = intcode[current_position+2]
      result_position = intcode[current_position+3]

      intcode[result_position] = intcode[comp1_position] + intcode[comp2_position]
    end

    if current_opcode == 2 # multiply
      comp1_position = intcode[current_position+1]
      comp2_position = intcode[current_position+2]
      result_position = intcode[current_position+3]

      intcode[result_position] = intcode[comp1_position] * intcode[comp2_position]
    end

    if current_opcode == 99 # program end
      break
    end

    current_position += 4
  end

  return intcode
end

day2_input_original = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,10,19,1,6,19,23,1,13,23,27,1,6,27,31,1,31,10,35,1,35,6,39,1,39,13,43,2,10,43,47,1,47,6,51,2,6,51,55,1,5,55,59,2,13,59,63,2,63,9,67,1,5,67,71,2,13,71,75,1,75,5,79,1,10,79,83,2,6,83,87,2,13,87,91,1,9,91,95,1,9,95,99,2,99,9,103,1,5,103,107,2,9,107,111,1,5,111,115,1,115,2,119,1,9,119,0,99,2,0,14,0]
day2_input = day2_input_original.clone
day2_input[1] = 12
day2_input[2] = 2

returned = run_intcode(day2_input)
puts returned.inspect
# => returned[0]: 3706713

# Part 2

# noun = day2_input[1]
# verb = day2_input[2]
# 0..99 for noun and verb
# Find the input noun and verb that cause the program to produce the output 19690720.

def test_noun_and_verb(noun, verb)
  day2_input = day2_input_original.clone
  day2_input[1] = noun
  day2_input[2] = verb
  product = run_intcode(day2_input)
  return product[0]
end

expected_product_zero = 19690720

0.upto(99) do |noun|
  0.upto(99) do |verb|
    result = test_noun_and_verb(noun, verb)



