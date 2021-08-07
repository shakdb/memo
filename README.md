# memo
Memoization in Q


# example usage

myfunc:{system"timeout 3"; x+y+z} /a fake 'long-running' function which sleeps for 3 secs

myfunc[1;2;3]
(returns '6' after 3 secs, subsequent calls also run for 3 secs each)

.memo.ize `myfunc
myfunc[1;2;3]
(returns '6' after 3 secs, subsequent calls return immediately)

/inspect the objects
myfunc
..
myfunc_orig
..
myfunc_cache
..
