/**
storeindex, is like reduce but stores indexes during the reduction.
if passed range doesnt define opIndex returns a range iterated to that index with sugary hacks

minindex==storeindex!((a,ai,b,bi)=> a<b? ai:bi)
maxindex==storeindex!"a>b?ai:bi"

note:indexable test is overwriteable and theres some hacks to make non-int returning lamdas work
*/
template isindexable(T){
	static if(is(typeof(T.init[0]))){
		enum isindexable=true;
	} else {
		enum isindexable=false;
}}
auto storeindex(alias F,R)(R r){
	return r.storeindex!(F,isindexable!R);
}
auto storeindex(alias F,bool indexable,R)(R r)(
	static if(is(typeof(F)==string)){
		auto F_(T,S,V,U)(T a,S ai,V b,U bi){
			return mixin(F);
		}
	}else{
		alias F_=F;
	}
	auto _r=r.enumerate;
	static if(indexable){
		auto outi=F_(;
	}else{
		typeof(R) outi;
	}
	while
	return outi;
}

head hurt meh