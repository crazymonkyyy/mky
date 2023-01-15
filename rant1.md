computer science only moves forward when a simple, clean, and flexable interface is adopted there have been 3 examples:

1. c, is an thin abstraction over (old) asm that allows toolkits to survive trasitions, once upon a time poeple were attempting to write languges compile to c, unforently llvm exists and oo memes derailed this and like hardware is doing wierd things so is c even still a good abstraction anymore? Regruadless, c allowed for the next abstraction:

2. unix, everything is a file and all commands take in steams of data to produce steams of data; ideally either plan 9 "windows are files" or temple os graphical shell would have successed, they didnt but here we are we still have bash and all languges worth a damn can write to shell and hopeful call other programs from shell. I wish there was still devoplment and a gui paradiem was intergrated(x11 is much to complex, and wayland is "safe" and an ever extending api bullshit)

3. inside languges, there are iterators that impliment map, filter, reduce and op overloads; I dont think these are nesserily well designed interfaces or that those 3 functions are a good list, none-the-less this is also a source of progress when c++ accidently made templates turing complete and steponov bashed his head into it to make the god damn thing work into stl. Then d attempted to mimik stl in a nicer way; still a buggy mess, still oo memes, but I think ill be in d for a while yet.

On the c front I think poeple should probaly compile to c or zig, or some new compeditors to the asm chips should take "risc" srs and make some god damn understandable asm instuction sets. But idk far outside what I know well.

On the os side, Im eyeing hiaku, I think oses for real work should be ring zero and a graphical shell, discard 3d rendering for video game consoles, discard safety for servers running linux. But where the hell am I going to get such a thing thats running well?

On iterators I currently use d, because dispite allot of hard feelings, front, popFront, empty isnt the worse interface none-the-less lets make a list anyway:

(note I consider all interfaces to be optional, they are just prefered so that sometime code just werks)

---

structs:
opBinary
opAssign
to!T
totermstring (for making colorful terminal output)
tohash
tobasetype (user vec2=> float[2], for serializing and other conversion abuse)
this(basetype)
this(string)
pointer ops
opRadix!(0..) (define the function for radix sort)
something for radix defination
isnull
isint (for floats vs ints if it matters)
init
max/min
random(for unittest fuzzing)

iters:
front!(0..) (zip, aa's and indexing should be first class, tuples in c style languges dont work well as far as ive seen)
front!-1 (magic value for indexes)
pop (I dont consider doublely linked lists to be first class citizens, so popfront vs popback is just a wasted abstraction)
empty
opIndex!(0..)
opIndexAssign!(0..)
opSlice
length/opdollar

functions:
Map,filter,reduce(given, stateful varients overloads?)
storeIndex (iterate thru a list with a function that reduces an index, return the index when done, max/min)
Reindex(do some math with an index before returning, reverse is reindex"$-i-1", also some details around length)
Sort
Radix-sort
Zip/unzip
Counter(0..int.max)
something for permutations(I dont understand those algorthms that well)
