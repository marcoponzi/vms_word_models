import sys
from lark import Lark,tree

         
f = open(sys.argv[1], 'r')
gname=sys.argv[1]
index=gname.rfind('/')
if (index>-1):
  gname=gname[index+1:]
index=gname.find('_')
if (index>-1):
  gname=gname[:index]

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
	    out_tree=lrk.parse(word)
	    sys.stdout.write("SUCCESS:True " + word+" ")
	    print(repr(out_tree).replace("Tree",""))
	    fname=word+"_"+gname+".png"
	    print(fname)
	    tree.pydot__tree_to_png( out_tree, fname)
	    success+=int(count)
	  except:
	    print("Exception  " + line)
	    #lrk.parse(word)

perc_succ=100.0*float(success)/float(tot)

print("TOT_WORDS: " + str(tot)+ " TOT_SUCCESS: " +str(success) + " TOT_FAIL: "+str(tot-success))
print('SUCCESS%: '+frmt(perc_succ)+ "  FAIL%: "+frmt(100.0 - perc_succ)) 
  

