# AC -> AC | 10101100 -> 10101100
# 56 -> 16 | 01010110 -> 00010110
# B9 -> F9 | 10111001 -> 11111001
# A5 -> A5 | 10100101 -> 10100101
 
# EC -> AC | 11101100 -> 10101100
# 16 -> 56 | 00010110 -> 01010110
# B9 -> B9 | 10111001 -> 10111001
# A5 -> A5 | 10100101 -> 10100101

set in_file [open "bitstream.hex" "r"]
set out_file [open "lab4.hex" "w"]

gets $in_file current_line
set current_byte [expr 0x$current_line]

while {[gets $in_file next_line] >= 0} {
  set next_byte [expr 0x$next_line]
  # puts "current_byte=$current_byte ([format %02X $current_byte])"
  # puts "next_byte=$next_byte ([format %02X $next_byte])"

  # get value of bit 6
  # mask to use: 01000000 in binary
  #           or 0x40 in hex
  # 0x56 0b01010110
  # 0x40 0b01000000 (1 << 6)
  # ----------------&
  #      0b01000000
  if {$next_byte & (1 << 6)} {
    # change bit-6 of current_byte to 1
    # use bitwise OR '|' to set specific bits 
    set output_byte [expr {
      $current_byte | (1 << 6)
    }]
  } else {
    # change bit-6 of current_byte to 0
    # use bitwise AND '&' and bitwise NOT '~' to reset specific bits
    set output_byte [expr {
      $current_byte & ~(1 << 6)
    }]
  }
  puts $out_file [format %02X $output_byte]


  set current_byte $next_byte
}

close $out_file
close $in_file
