import sqlite3
pn=[]
kk=[]
jj=[]
bb=[]
uu=[]
with open('1.txt','r') as f:
    f=f.readlines()
    for i in f:
        i=i.split(';')
        pn.append(i[0])
        kk.append(i[1])
        jj.append(i[2])
        bb.append(i[3])
        uu.append(i[4])
for m in range(1042):
    print (pn[m],kk[m],jj[m],bb[m],uu[m])
    cursor = sqlite3.connect('main.db').cursor()
    cursor.execute("INSERT INTO products VALUES ('%s','%s','%s','%s','%s')" % (pn[m],kk[m], jj[m],bb[m], uu[m]))
    try:
        cursor.execute("COMMIT")
    except sqlite3.OperationalError:
        pass