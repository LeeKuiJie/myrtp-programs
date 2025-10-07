set searchText "Where there is a will, there is a way"
set result [regexp {(^\w{3}).*(\w{2}$)} $searchText fMatch sMatch1 sMatch2]
puts $result; puts $fMatch; puts $sMatch1; puts $sMatch2

regsub {way} $searchText {WAY} newText
puts $newText

set searchText "Where there is a will, there is a way way way"
regsub {way} $searchText {WAY} newText
puts $newText
regsub -all {way} $searchText {WAY} newText
puts $newText
