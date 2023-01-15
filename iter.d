/*
front!(0..) (zip, aa's and indexing should be first class, tuples in c style languges dont work well as far as ive seen)
front!-1 (magic value for indexes)
pop (I dont consider doublely linked lists to be first class citizens, so popfront vs popback is just a wasted abstraction)
empty
opIndex!(0..)
opIndexAssign!(0..)
opSlice
length/opdollar
*/
auto toiter(T)(T[] arr){
	struct iter{
		T[] arr;
		int i;
		ref T front(int k:0=0)() =>arr[i];
		ref int front(int k:-1)()=>i;
		void pop(){i++;}
		int length()=>cast(int)arr.length-i;
		void length(int j){arr.length=i-j;}
		int opDollar()=>length;
		bool empty()=>length<=0;
		ref T opIndex(int k:0=0)(int j)=>arr[i+j];
		iter opSlice(int j,int k)=>iter(arr[i+j..i+k]);
	}
	return iter(arr);
}
auto print(I)(I i){
	import std;
	while(!i.empty){
		i.front.write;
		",".write;
		i.pop;
	}
	writeln;
}
unittest{
	import std;
	auto foo=[1,2,3,4,5].toiter;
	foo.front=10;
	foo.front.writeln;
	foo.pop;
	foo.empty.writeln;
	foo[3].writeln;
	foo[3]=4;
	foo[3].writeln;
	"---".writeln;
	foo.arr.writeln;
	foo.front!(-1)--;
	foo=foo[0..3];
	foo.print;
	foo.front!(-1).writeln;
	foo.front!(-1)=-100;
	foo.front!(-1).writeln;
	foo[100].writeln;
	"---".writeln;
	auto bar=foo[100..$];
	bar.print;
	bar.arr.writeln;
}