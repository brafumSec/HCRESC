#coding:utf-8
import re
#print("input file name：")
#name=input()
#with open(name) as f:
#    list=f.readlines()

with open('computing-1-calculator.s') as f:
    list=f.readlines()
lr=[]   #list of variable r
ln=[]   #lr中每个r对应的行号
leng=len(list)
i=-1
while i < leng-1:
    i+=1
    list[i]=list[i].rstrip('\n')
    #print (i+1,list[i])
    reg=r'\s+([\w]+)\s+([+-\\*\d\)\(%a-z\$]+),\s+([+-\\*\d\)\( %a-z\$]+)'
    r=re.search(reg,list[i])
    if r != None:
        #print(r.group(1),r.group(2),r.group(3))
        if r.group(1)=='cmpl':   #cmpl的话，其后一定是jne or je 与此行算为一条指令
            i+=1
            list[i]=list[i].rstrip('\n')
            lr+=[r]
            ln+=[str(i)+"+"+str(i+1)]
        else:
            lr+=[r]
            ln+=[str(i+1)]
    else:
        if len(ln)<=0:
            continue
        print(ln)
        res=''
        for j in range(0,len(lr)):
            t2=lr[j].group(2)
            t3=lr[j].group(3)
            for k in range(j+1,len(lr)):
                #print(lr[j].group(),lr[k].group())
                if lr[k].group(2)==t3 or lr[k].group(3)==t3 or lr[k].group(3)==t2:
                    #print("group",j,k)
                    #print(lr[k].group(2),t3)
                    #print(lr[k].group(3),t3)
                    #print(lr[k].group(3),t2)
                    res+=ln[j]+"->"+ln[k]+" "
	print("res:",res)
	print "\n"        
        lr=[]
        ln=[]
