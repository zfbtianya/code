#/usr/bin/python
# *-* coding=utf-8

sums = 0
print 'start'
f = open('test/record.txt', 'r')
for line in f:
    print line
    if '#' in line or len(line) < 5:
        continue
    name,age,score = line.split(',')
    score = int(score)
    if score < 60:
        print name,'得分低于60'
    if name[0] == 'L':
        print name,'的名字以L开头'
    sums += score
print '总分是',sums
f.close()        
