# Bitwise operations
#
#
# (123)_10 = 1*100  + 2*10   + 3*1

#          = (1*10^2 + 2*10^1 + 3*10^0)

# d          b
# 0         0000
# 1         0001
# 2         0010
# 3         0011
# 4         0100
# 5         0101
# 6         0110
# 7         0111
# 8         1000
# 9
# 10        1010
# 11
# 12
# 13
# 14
# 15
# 16
# 17
# 18

  0000000000|1|000     size
& 1111111111|1|000   ~(size - 1)
---------------------------------
  0000000000|1|000

  0000000000|1|001     size
& 1111111111|0|111   ~(size - 1)
---------------------------------

00000000000000000000000000000000000000000000000000000000000000000000000000000123
00000000000000000000000000000000000000000000000000000000000000000000000000000110

 10101001001010101010101010101010100010101010
 00000000000000000000000000000000000010000000
#define IS_ADMIN (2**8)

if (config & (IS_ADMIN | LIKE_PIE | LOVES_DOGS)) {
  do admin things
}



  10001111101101110110111010101000111101100011
& 00000000000000000000000000000000000000000001
----------------------------------------------
  00000000100001000000010000000000000000000001


0000
1111 -> -7


int cou

# 0101 << 1 = 1010  (equivalent to multiplying by 2)
# 0101 >> 1 = 0010  (equivalent to integer division by 2)
# &       - Bit-wise AND
# |       - Bit-wise OR
# ^       - Bit-wise XOR
# <<      - Shift left
# >>      - Shift right
#
# ~

# int count_bits(int num) {
#   // return number of bits set to 1 in the binary representation of num
# }
