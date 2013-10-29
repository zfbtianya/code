#!/usr/bin/env python
#problem:there four numbers:1,2,3,4;how many numbers of three digits you can
#make?what are they?

def dical_plus(lst,n):
    res=set();
    if n <= 1:
        return set([(x,) for x in lst])
    for l in dical_plus(lst,n-1):
        for x in lst:
            res.add(l+(x,))
    return res

print dical_plus([1,2,3],2)

def no_repeat(tup):
    if len(tup)<=1:
        return True
    else:
        for i in tup[1:]:
            if tup[0] == i:
                return False
        return no_repeat(tup[1:])
            
def nums(lst,n):
    res = set()
    for tup in dical_plus(lst,n):
        if no_repeat(tup):
            res.add(tup)
    return res

def print_nums(lst,n):
    i = 1
    for num in nums(lst,n):
        print "%d:" %i,''.join(map(str,num))
        i+=1

#print nums([1,2,3,4],3)
print_nums([1,2,3,4],3)
