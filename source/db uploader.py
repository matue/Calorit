import sqlite3
pn=[]
kk=[]
jj=[]
bb=[]
uu=[]
ct=[]
with open('db.csv','r') as f:
    f=f.readlines()
    for i in f:
        i=i.split(';')
        pn.append(i[0])
        bb.append(i[1])
        jj.append(i[2])
        uu.append(i[3])
        kk.append(i[4])
        ct.append(i[5])
cursor = sqlite3.connect('main.db').cursor()
for m in range(1042):
    print (pn[m],bb[m],jj[m],uu[m],kk[m],ct[m])
    cursor.execute("INSERT INTO products VALUES ('%s','%s','%s','%s','%s','%s')" % (pn[m], bb[m], jj[m], uu[m], kk[m], ct[m]))
    try:
        cursor.execute("COMMIT")
    except sqlite3.OperationalError:
        pass