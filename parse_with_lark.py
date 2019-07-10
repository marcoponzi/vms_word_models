import sys
from lark import Lark

         
f = open(sys.argv[1], 'r')

lrk = Lark(f)

tot=0
success=0

def frmt(myfloat):
  return "{:.3f}".format(myfloat)

for line in sys.stdin:
  line=line.rstrip()
  if (len(line)>0):
          count=1
	  items=line.split()
	  word=items[0]
	  if (len(items)>1):
	    if (items[0].isdigit()):
	      count=items[0]
	      word=items[len(items)-1]
	    else:
	      count=items[len(items)-1]
	  tot+=int(count)
	  print("'"+line+"'")
	  try:
	    tree=lrk.parse(word)
	    sys.stdout.write("SUCCESS:True " + word+" ")
	    print(repr(tree).replace("Tree",""))
	    success+=int(count)
	  except:
	    print("SUCCESS:False  " + line)
	    #lrk.parse(word)

perc_succ=100.0*float(success)/float(tot)

print("TOT_WORDS: " + str(tot)+ " TOT_SUCCESS: " +str(success) + " TOT_FAIL: "+str(tot-success))
print('SUCCESS%: '+frmt(perc_succ)+ "  FAIL%: "+frmt(100.0 - perc_succ)) 
  

