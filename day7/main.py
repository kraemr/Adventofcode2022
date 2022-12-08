
class Node:
    def __init__(self,parent,size,name,children):
        self.parent = parent
        self.size = size
        self.name = name
        self.children = children
        if self.size == -1:
            self.isfile = False
            self.size = 0
        else: 
            self.isfile = True

    def add_child(self,node):
        for child in self.children:
            if child.name == node.name:
                return
        self.children.append(node)
   

def get_child(node,str): # works
    print("get child from",node.name)
    for n in node.children:
        print( n.name)
        if n.name == str:
            return n

orig = Node(None,1,"",[])

def calc_directory_size(node):
    tempsum = 0
    for n in node.children:
        if(n.isfile):
            print(node.name, "  ",n.name,"file: ",n.isfile)
            tempsum += n.size
        else:
            calc_directory_size(n)
    if tempsum < 100000:
        orig.size += tempsum
       


root = Node(None,-1,"/",[])
currnode = root
lines = []
c = 0
with open("input2") as file_in:

    for line in file_in:
        lines.append(line)

for line in lines:
    line = line.strip()
    if(c == 0):
        root = Node(None,-1,"/",[])
        currnode = root
        c+=1
        continue
    spl = line.split(" ")

    if spl[0] == "$" and spl[1] == "cd":
        if spl[2] == "..":
            print("cd .. to: " , currnode.parent.name)
            currnode = currnode.parent
        elif spl[2] == "/":
            print("cd to root")
            currnode = root
        else:
            print("cd to ",currnode.name)
            currnode = get_child(currnode,spl[2])
    
    elif spl[0] == "dir":    
        print("adding dir: " , spl[1] , " to " , currnode.name )
#        print("add dir",spl[1]," to ",currnode.name)
        currnode.add_child(Node(currnode,-1,spl[1],[]))
    
    elif spl[0] == "$" and spl[1] != "cd":
        print("ls")
    
    else:
        print(" add file",spl[0]," ",spl[1],"to",currnode.name)
        currnode.add_child(Node(currnode,int(spl[0]),spl[1],[]))
        # in here increase the directory size according to file size
    

#n = find_Node(,"j")
#print(n.str)
#orig = root
#for n in root.children:
    #calc_directory_size(n)
    #print(orig.size)


node = get_child(root,"a")
calc_directory_size(root)
sum = 0
print(orig.size)
