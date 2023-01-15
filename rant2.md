radix sort IS FUCKING IMPORTANT

algorthimic complexity is the name of the game and sorted data make for binary sreach

The thing is sort is "easy" because oo languges add an op overloads for comparisions, and then someone impliments one in the std, and then when you have structs you reuse the compares of the base types to make your own. It easily could be the case that a languge defines radix operations for a base types, and put a radix sort in an std; altho not with an oo languge

That coding compeations ask for solutions that have complexity of n log n, that languges define a n log n sort, that everyone is using oo interfaces and have a "comparable" or something; is just status quo bias.

Its not just ints, you can radix sort (ascii) strings with 27 buckets trivailly, just toLower and group up all non alpha charaters. Then using comparision sorts when n<100,(and non ascii) the same way std sorts tend to use bubble sort for lists that are n<7. How you do unicode is probaly a whole mess, but its the hard case, compare sorts for strings are also kinda awful.

