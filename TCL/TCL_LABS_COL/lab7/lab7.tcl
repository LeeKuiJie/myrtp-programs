dict set items_data A0 {itemName "Matcha         " itemPrice 10}
dict set items_data A1 {itemName "Coffee         " itemPrice 12}
dict set items_data A2 {itemName "Tea            " itemPrice 11}
dict set items_data B0 {itemName "Burger         " itemPrice 20}
dict set items_data B1 {itemName "Pizza          " itemPrice 30}
dict set items_data B2 {itemName "Sandwich       " itemPrice 25}
dict set items_data C0 {itemName "Nasik Lemak    " itemPrice 20}
dict set items_data C1 {itemName "Roti Canai     " itemPrice 30}
dict set items_data C2 {itemName "Mee Goreng     " itemPrice 25}


#puts "\n------- Vending Machine Simulation with TCL-------\n"
#puts "----------The Items In Stock Are----------\n"

#foreach item [dict keys $items_data] {
#   puts "[dict get $items_data $item itemName] \t--- Price: RM[dict get $items_data $item itemPrice] \t Item ID: $item "
#}
#
set fH [open "my_ven_mach.txt" r]
set allLines [read $fH]
close $fH
foreach item [dict keys $items_data] {
   set iname [dict get $items_data $item itemName]
   regsub "$item NameXXXXXXXX" $allLines $iname allLines
   set iprice [dict get $items_data $item itemPrice]
   #set iprice "$iprice [string repeat  { } [expr 7 - [string length $iprice]]]"
   set iprice [format "%-8d" $iprice]
   regsub "$item Price" $allLines $iprice allLines
}
puts "$allLines"

set itemList {}
while {1} {
	puts "\nEnter the Item ID for the item you want to buy or type Q to stop: "
        set buyItem [gets stdin]
        set buyItem [string toupper $buyItem]
        if {$buyItem == "Q"} { break }
        if {[dict exist $items_data $buyItem]} {
                lappend itemList $buyItem
        } else {
                puts "The Product ID is wrong!"
        }
}
puts "\033\[31m" ; # red foreground
puts "\nSelected Items: $itemList\n"
puts "\033\[32m" ; # green foreground
puts "\033\[32m" ; # green foreground
set sum 0
foreach i $itemList {
        puts "\t[dict get $items_data $i itemName] \t-- RM[dict get $items_data $i itemPrice] "
        set sum  [expr $sum + [dict get $items_data $i itemPrice] ]
}
puts "\tTOTAL           \t-- RM$sum\n"
puts "\033\[30m" ; # black foreground
puts "Your Selection Completed!"


