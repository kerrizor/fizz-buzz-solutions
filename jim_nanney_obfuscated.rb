# Never ever do this, but print it on a business card to take to interviews.
#
# It's accomplished in an IOCCC style
#
# Essentially I have the answer for the first 15 items of fizz buzz, encoded as place values for the array
# [i, 'fizz', 'buzz', 'fizzbuzz']
# Positionally the answer requires only two bits to store. Take all 15 positions needed and reverse the list
# (thanks to JEG2, for reminding us to take any problem and reverse it)
# Once the list is reversed, mapreduce the array by adding each position to an accumulated value, and
# bitshifting two bits to the left.
#
# This leaves us with the positions encoded as the value 810092048
#
# I then iterate over the range 1..100 printing the index of the fizzbuzz answers array
# given by pulling the 2 bits from the encoded value for that position ((fizzbuzz position -1) modulo 15) bitshifted
# back to the right. It has to be bitwise ANDed against the complement to prevent the other bits from interfering
# with the position.
#
# I rolled it up to a one-liner to help kill readability.
#
v=810092048;(1..100).map{|i|p [i,'fizz','buzz','fizzbuzz'][(v>>(((i-1)%15)*2))&~0xFFFFFFFC]}
