# memo
Memoization in Q



# example usage
1. define a 'long-running' function
```
q) myfunc:{system"timeout 3"; x+y+z}
```

2. call the function several times with the same arguments and notice the run time each time
```
q) myfunc[1;2;3]
6
```

3. memoize and notice that the result is returned with **no delay for subsequent calls with the same arguments**
```
q) .memo.ize `myfunc
q) myfunc[1;2;3]
6
```

4. optional: inspect the objects
```
q) myfunc
..
q) myfunc_orig
..
q) myfunc_cache
..
```
