I want stateful map, reduce and filter

when writing c style code you can impliment something that skips every other element in a list with a
```c
for(int i;i<array.length;i++){
  if(i%2){break;}
```
but its a whole song and dance in ranges; why?

prefixs sum like algrothims is a whole thing with a foot gun of "where do you put the data" that lead to context issues

but what if.... map reduce and filter could just mixin 2/3 strings, an outer context string and an inner function string

prefixsum==map!("int store;","store+a","store+=a")

and then if theres a context issue you could also just "import mytypes;" in the outscope rather then figuring out dual context.

side note I also want reindex so you couldve written
`for(int i;i<array.length;i+=2){` as `reindex!("a*2","$/2+$%2")`