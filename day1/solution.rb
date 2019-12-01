def fuel_required_for_module(mass)
  fuelreq = (mass.to_i / 3) - 2
  fuelreq
end

masses = File.open("input.txt", "r").readlines.map(&:to_i)
fuels = masses.map{ |m| fuel_required_for_module(m) }
total_fuel = fuels.sum

puts "total fuel required: #{total_fuel}"
