def fuel_required_for_module(mass)
  fuelreq = (mass.to_i / 3) - 2
  fuelreq
end

def fuel_required_for_module_part2(mass)
  last = fuel_required_for_module(mass)
  total = 0
  while(last > 0) do
    total += last
    last = fuel_required_for_module(last)
  end
  total
end

# Part One
masses = File.open("input.txt", "r").readlines.map(&:to_i)
fuels = masses.map{ |m| fuel_required_for_module(m) }
total_fuel = fuels.sum
puts "Part One: total fuel required: #{total_fuel}"

# Part Two:

fuels_two = masses.map{ |m| fuel_required_for_module_part2(m) }
total_fuel_two = fuels_two.sum
puts "Part Two: total fuel required: #{total_fuel_two}"
