auto foo(alias F)(){
	static if(is(typeof(F)==string)){
		return "string";
	}else{
		return "function";
}}
unittest{
	void bar(){};
	assert(foo!"bar"=="string");
	assert(foo!bar=="function");
}
//bool isindexable(T)(){
//	static if(is(typeof(T.init[0]))){
//		return true;
//	}else{
//		return false;
//}}
template isindexable(T){
	static if(is(typeof(T.init[0]))){
		enum isindexable=true;
	} else {
		enum isindexable=false;
}}
unittest{
	assert(isindexable!(int[])==true);
	assert(isindexable!(int)==false);
	import std;
	auto foo=iota(0,10).map!(a=>2*a);
	assert(isindexable!(typeof(foo)));
}
auto storeindex(alias F,R)(R r){
	return r.storeindex!(F,isindexable!R);
}
auto storeindex(alias F,bool indexable,R)(R r){
	return indexable;
}
unittest{
	import std;
	auto foo=iota(0,10).map!(a=>2*a);
	foo.storeindex!("foo",false);
	1.storeindex!(a=>a,true);
	foo.storeindex!(a=>a);
	1.storeindex!("bar");
}