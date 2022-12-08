Lines = []
currentDirectory = ""

function decode(line)

end

struct Element
    name::String
    data::Int64
    loe
end

F1 = Element("F1", 1, nothing)
D6 = Element("D6", 0, [F1])


import AbstractTrees: children, printnode, print_tree, Leaves
children(el::Element) = something(el.loe, [])
sum_data_element(el::Element) = sum(map(x->x.data, Leaves(el)))
printnode(io::IO, el::Element) = print(io, el.name, ' ', el.data)
print_tree(D6)

# in a line that has $ ignore except if it is followed by cd
# which changes the current directory to the string following cd
# files have a value left to their name, which is their file size

#Find all of the directories with a total size of at most 100000. What is the sum of the total sizes of those directories?
#in the / node count the size
open("input.txt") do f
    c = 0
    while !eof(f)
        s=readline(f)
        c+=1
        strarr = split(s," ",limit = 4)
    println(strarr)
    end
end