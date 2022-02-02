; strongly inspired by Brodul's recursive Python solution
; Look at "_steps" file for more information (will be uploaded soon)

compress-rec: fn { inp cnt res } { c: inc cnt 
  ^if inp .length = 1 { res + c .str + inp } 
  ^if inp .first = second inp { compress-rec tail inp c res } 
  compress-rec  tail inp  0  res + c .str + first inp 
}

compress: fn1 { .compress-rec 0 "" }

compress "AAABBAAC" |assert-equal "3A2B2A1C"
