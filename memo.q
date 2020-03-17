
/returns a hash of any kdb object (helper function to generate a cacheKey of big arguments)
.opt.hash:{[obj]    / obj - any kdb object
  toString:{$[98=t:type x; .z.s flip x; 99=t; .z.s[key x],.z.s value x; 0h=t; raze .z.s each x; (raze/) string x]};
  :md5 toString obj;
  };

/given the name of a pure (referentially transparent) function, memoizes it
.opt.memoize:{[funcName]
  err:"error (.opt.memoize): expected the symbol/string name of a (pure) function";
  $[not type[funcName] in -11 10h; 'err; 100h<>type f:value funcName; 'err;];
  funcName:raze string funcName;
  (`$funcName,"_orig")set f;
  (`$funcName,"_cache")set enlist[`]!enlist(::);
  params:(value f)1;
  str:"{[",(";"sv string params),"]\r\n";
  str,:"  cacheKey:`$raze string .opt.hash (",(";"sv string params),");\r\n";
  str,:"  if[(::)~",funcName,"_cache[cacheKey]; ",funcName,"_cache[cacheKey]:",funcName,"_orig[",(";"sv string params),"]];\r\n";
  str,:"  :",funcName,"_cache[cacheKey];\r\n  }\r\n";
  (`$funcName)set value str;
  };
