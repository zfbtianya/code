#!/usr/bin/python
# -*- coding=utf-8 -*- unicode,utf-8,utf-16,GBK,GB2312,ISO-8859-1
#unicode转换为GBK
#isinstance(s,str)
#isinstance(s,unicode)
import locale
import os,sys
#get
print locale.getdefaultlocale()
#set
#locale.setlocale()
def u(s,encoding):
    if isinstance(s,unicode):
        return s
    else:
        return unicode(s,encoding)
print u(u'汉字','utf-8')
    
a = u"中文"
a_gb2312 = a.encode('gb2312')
print 'a_gb2312=',a_gb2312
print a_gb2312
print 'Hello World!'
s1 = (True,False,0)#tuple
s2 = [2,2,3]#string
print s1,s1[1:-1:1],s2[0:-1:1]#[上限:下限:步长]
#字符串是tuple
#数学 +, -, *, /, **, %
#判断 ==, !=, >, >=, <, <=, in
#逻辑 and, or, not
if False:
    print 1
    pass
elif False:
    print 2
    pass
else:
    print 3
    pass
def a_for():
    for a in range(5):
        print a
        #continue
        #break
    return True#没有return,返回None
print None

a = 1
def change_integer(a):
    a = a + 1
    return a
print a,"a 是一个标量,传值,不改变原值"
print change_integer(a)
print a


#===(Python中 "#" 后面跟的内容是注释，不执行 )

b = [1,2,3]
def change_list(b):
    b[0] = b[0] + 1
    return b
print b,"b是一个矢量,传指针,改变原值"
print change_list(b)
print b
class Bird(object):
    have_feather = True
    way_of_reproduction = 'egg'
    def move(self, dx, dy):
        position = [0,0]
        ds = [dx,dy]
        des = [position[0]+ds[0],position[1]+ds[1]]
        return des
summer = Bird()
print 'after move:',summer.move(5,8)

class Chicken(Bird):
    way_of_move = 'walk'
    possible_in_KFC = True

class Oriole(Bird):
    way_of_move = 'fly'
    possible_in_KFC = False

summer = Chicken()
print summer.way_of_move#调用类属性
print summer.have_feather
print summer.move(5,8)

#__init__()方法的特殊在于，如果你在类中定义了这个方法，一旦你根据这个类建立对象，
#Python就会自动调用这个方法（这个过程也叫初始化）
class happyBird(Bird):
    def __init__(self,more_words):
        print 'We are happy birds.',more_words

summer = happyBird('Happy,Happy!')

class Human(object):
    def __init__(self, input_gender):
        self.gender = input_gender
    def printGender(self):
        print self.gender

li_lei = Human('male') # 这里，'male'作为参数传递给__init__()方法的input_gender变量。
print li_lei.gender#调用对象性质
li_lei.printGender()
#两个内置帮助函数

#print dir(list)
#print help(list)

class superList(list):
    def __sub__(self, b):
        a = self[:]     # 这里，self是supeList的对象。由于superList继承于list，它可以利用和list[:]相同的引用方法来表示整个对象。
        b = b[:]        
        while len(b) > 0:
            element_b = b.pop()
            if element_b in a:
                a.remove(element_b)
        return a

print superList([1,2,3]) - superList([3,4])

dic = {'lilei': 90, 'lily': 100, 'sam': 57, 'tom': 90}
for key in dic:
    print dic[key]
    
del dic['tom']
print type(dic)
print dic.keys()
print dic.values()
print dic.items()
print len(dic)
dic.clear()
f = open('/home/zengfb/.emacs','r')#'r','w'
content = f.read(5)          # 读取N bytes的数据
print content
content = f.readline()       # 读取一行
print content
content = f.readlines()      # 读取所有行,储存在表中,每个元素是一行.
print content
#f.write('I like apple')
f.close()

def laugh():
    print 'HaHaHaHa'

import os
for i in range(10):
    os.system('ls')
'''Python会在以下路径中搜索它想要寻找的模块：
1. 程序所在的文件夹
2. 标准库的安装路径
3. 操作系统环境变量PYTHONPATH所包含的路径'''

'''可以将功能相似的模块放在同一个文件夹（比如说dir）中，通过
import dir.module
该文件夹中必须包含一个__init__.py的文件，以便提醒python知道该文件夹为一个模块包。__init__.py可以是一个空文件。
'''
'''在func的参数表中，所有的参数被name收集，根据位置合并成一个定值表(tuple)'''
#在dict前加**

def func(*name):
    print type(name)
    print name

func(1,4,6)
func(5,6,7,1,2,3)
'''*和**在调用的时候的应用，主要是解包裹(unpacking)'''
def func(a,b,c):
    print a,b,c

args = (1,3,4)
func(*args)

S = 'abcdefghijk'
for i in range(0,len(S),2):
    print S[i]
#利用enumerate(), 同时得到下标和元素
S = 'abcdefghijk'
for (index,char) in enumerate(S):
    print index
    print char
#利用zip(), 实现并行循环
ta = [1,2,3]
tb = [9,8,7]
tc = ['a','b','c']
for (a,b,c) in zip(ta,tb,tc):
    print a,b,c
#循环对象(iterable object)
#循环对象是这样一个对象，它包含有一个next()方法
#for line in open('lab.py'):     
#    print line
'''生成器的编写方法和函数定义类似，只是在return的地方改为yield。生成器中可以有多个yield。
当生成器遇到一个yield时，会暂停运行生成器，返回yield后面的值。
当再次调用生成器的时候，会从刚才暂停的地方继续运行，直到下一个yield。
生成器自身又构成一个循环器，每次循环使用一个yield返回的值。'''
def gen():
    a = 100
    yield a
    a = a*8
    yield a
    yield 1000
for i in gen():
    print i
#生成器表达式(Generator Expression):
G = (x for x in range(4))
#表理解是快速生成表的方法。
L = []
for x in range(10):
    L.append(x**2)
#函数作为对象    
func = lambda x,y:x+y
print func(3,4)

#函数作为参数
def test(f, a, b):
    print 'test'
    print f(a, b)

test(func, 3, 5)
t = test
t(func, 3, 5)
#map 函数
re = map((lambda x,y:x+y),[1,3,5,6],[222,333,444,555])
print re
#filter函数
def func(a):
    if a > 100:
        return True
    else:
        return False

print filter(func,[10,56,101,500])
#reduce函数
print reduce((lambda x,y:x+y),[1,2,3,4,5])

#错误处理 try->except/else/finally
re = iter(range(5))
try:
    for i in range(100):
        print re.next()
except StopIteration:
    print 'here is end',i
else:
    pass
finally:
    pass
print 'HaHaHaHa'
#raise StopIteration()
#动态类型
def f(x):
    x[0] = 100
    print x

a = [1,2,3]
f(a)
print a
#序列的方法
#适合所有序列
s = (1,2,4)
print len(s)
print min(s)
print max(s)
print all(s)
print any(s)
#适用与表和元组
print sum(s)
print s.count(2)
print s.index(4)
#适用与表
l = [1,2,4,5]
l2 = [3,6,7,8]
l.extend(l2)
print l
l.append(s)
print l
l.sort()
print l
l.reverse()
print l
l.pop()
print l
del l[2]
print l
#字符串的方法
str1 = 'wow, zfb is a man named zfb'
sub = 'zfb'
print len(str1)
print str1.count(sub)
print str1.find(sub)#未找到返回-1
print str1.index(sub)#未找到返回错误
print str1.rfind(sub)
print str1.rindex(sub)
print str1.isalnum()
print str1.isalpha()
print str1.isdigit()
print str1.istitle()
print str1.isspace()
print str1.islower()
print str1.isupper()
sep = ' '
end = 2
print str1.split(sep,end)
print str1.rsplit(sep,end)
new_sub = 'bfz'
print str1.join([str(i) for i in s])
print str1.strip()
print str1.replace(sub, new_sub)
print str1
print str1.capitalize()
print str1
print str1.lower()
print str1
print str1.upper()
print str1
print str1.swapcase()
print str1
print str1.title()
print str1
print str1.center(5)
print str1.ljust(5)
print str1.rjust(5)

f = open('a.txt','w')
lines = ['first line\n','secondd line\n','third line\n','芝麻开门\n','俄罗斯\n']
f.writelines(lines)
f.close
reads = open('a.txt','r').readlines()
for line in reads:
    print line,
print ''
#正则表达式
import re
m = re.search('[0-9]','abcd4ef')
m1 = re.match('[0-9]','abcd4ef')
ms = re.split('[0-9]','abcd4ef')
ma = re.findall('[0-9]','abcd4ef')
mg = re.search("output_(\d{4})", "output_1986.txt")
print(m.group(0))
mgn = re.search("output_(?P<year>\d{4})", "output_1986.txt")   #(?P<name>...) 为group命名
print(mgn.group("year"))
#str = re.sub(pattern, replacement, string) 
# 在string中利用正则变换pattern进行搜索，对于搜索到的字符串，用另一字符串replacement替换。返回替换后的字符串。
#str = re.sub(pattern,replacement,string)
#re.split,re.findall
print (m.group(0))
import time
print time.time()
print time.clock()
time.sleep(10)
st = time.gmtime()      # 返回struct_time格式的UTC时间
st = time.localtime()   # 返回struct_time格式的当地时间, 当地时区根据系统环境决定。
s  = time.mktime(st)    # 将struct_time格式转换成wall clock time
import datetime
#是2012年9月3日21时30分
t = datetime.datetime(2012,9,3,21,30)
print(t)
t      = datetime.datetime(2012,9,3,21,30)
t_next = datetime.datetime(2012,9,5,23,30)
delta1 = datetime.timedelta(seconds = 600)
delta2 = datetime.timedelta(weeks = 3)
print(t + delta1)
print(t + delta2)

print(t_next - t)

