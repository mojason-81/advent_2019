masses = "144968 146267 93774 66835 139920 65875 131321 108023 115369 94673 117989 127700 65335 81728 57601 140987 54606 91215 143883 131858 91864 149716 103598 118128 100712 108947 146637 80490 120895 52862 54410 99435 85306 58179 88679 71725 144885 145211 129650 146724 108649 95874 98155 118901 142581 133366 95823 87308 124940 145709 118384 85552 90275 136930 90085 50895 146422 125462 106267 131561 112356 101503 101531 84320 76950 51906 122922 136102 104329 63004 141827 134044 128319 95080 90765 87322 61905 65293 138240 74660 55963 83560 87871 106145 140945 114416 99056 53210 74577 120291 112627 102146 54700 112290 133848 113707 78735 54557 79540 143154".split(" ").map { |s| s.include?(".") ? s.to_f : s.to_i }

calc = -> (mass) { (mass / 3).to_i - 2 }

calc_fuel_for_fuel = -> (fuel) {
  fuel_list = []
  next_amount = fuel.dup
  loop do
    next_amount = calc.(next_amount)
    break if next_amount <= 0
    fuel_list << next_amount
  end
  fuel_list.sum
}

calc_more_fuel = -> (fuels) {
  fuels.reduce(0) { |memo, fuel| memo += calc_fuel_for_fuel.(fuel) } 
}

module_fuel_list = masses.map { |mass| calc.(mass) }

total_fuel_for_modules = module_fuel_list.sum

puts calc_more_fuel.(module_fuel_list) + total_fuel_for_modules
