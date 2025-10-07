puts "Enter your hometown name:"

gets stdin hometown

puts "Enter what year you were born:"

gets stdin year

set current_year [clock format [clock seconds] -format "%Y"]
puts "Hello [lindex $argv 1], [lindex $argv 0] age [expr $current_year-$year] years old from $hometown"

