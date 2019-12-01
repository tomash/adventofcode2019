import math

def fuel_required_for_module(mass):
  fuelreq = math.floor(mass / 3) - 2
  return fuelreq

def fuel_required_for_module_part2(mass):
  last = fuel_required_for_module(mass)
  total = 0
  while last > 0:
    total += last
    last = fuel_required_for_module(last)
  return total



masses = []
f = open("input.txt", "r")
for m in f:
  masses.append(int(m))

# Part One
fuels_one = list(map(fuel_required_for_module, masses))
total_fuel_one = sum(fuels_one)
print("Part One: total fuel required: %d"% (total_fuel_one))

# Part Two

fuels_two = list(map(fuel_required_for_module_part2, masses))
total_fuel_two = sum(fuels_two)
print("Part Two: total fuel required: %d"% (total_fuel_two))
