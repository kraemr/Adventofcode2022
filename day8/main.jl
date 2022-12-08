# all trees on edges are visible 
# for tree to be visible there cant be 
global lines = []
global xsize = 0
global ysize = 0



# checks if a tree is visible
function is_visible(x , y , xsize, ysize)
    # check for x and y if they are 
    in_x = 1 
    lvis = true
    rvis = true
    uvis = true
    dvis = true
    in_num = parse(Int,lines[y][x])
    while( in_x <= xsize)
        # first check x 
        #print(lines[y][in_x])
        if in_x > x &&  parse(Int,lines[y][in_x]) >= in_num
            rvis = false
        elseif in_x < x &&  parse(Int,lines[y][in_x]) >= in_num
            lvis = false
        end
        
        in_x+=1
    end
    in_y = 1
    while( in_y <= ysize)
       # println(lines[in_y][x])
        if in_y > y &&  parse(Int,lines[in_y][x]) >= in_num
            dvis = false
        elseif in_y < y &&  parse(Int,lines[in_y][x]) >= in_num
            uvis = false
        end
        in_y+=1
    end
    #println("x:$x, y:$y, $in_num, u:$uvis ,d:$dvis ,r:$rvis,l: $lvis")
    return (uvis | dvis | rvis | lvis)
end

# calculates the scenic score for a tree
function calculate_scenic_score(x,y,xsize,ysize)
    in_x = x
    in_y = y
    in_num = parse(Int,lines[y][x])
    global scenic_arr = []
    vec_i = 1
    push!(scenic_arr,0)
    push!(scenic_arr,0)
    push!(scenic_arr,0)
    push!(scenic_arr,0)

    while(in_x > 1)
        if(in_x != x && parse(Int,lines[y][in_x]) >= in_num)
            break
        else
            scenic_arr[vec_i] += 1
        end
        in_x-=1
    end
    vec_i+=1
    in_x = x

    while(in_x < xsize )
        if(in_x != x && parse(Int,lines[y][in_x]) >= in_num)
            break;
        else
            scenic_arr[vec_i] += 1
        end
        in_x+=1
    end

    vec_i+=1
    in_y = y

    while(in_y > 1 )
        if( in_y != y && parse(Int,lines[in_y][x]) >= in_num)
            break;
        else
            scenic_arr[vec_i] += 1
        end
        in_y-=1
    end

    vec_i+=1
    in_y = y

    while(in_y < ysize )
        if( in_y != y && parse(Int,lines[in_y][x]) >= in_num)
            break;
        else
            scenic_arr[vec_i] += 1
        end
        in_y+=1    
    end
   # print("$scenic_arr")

    scenic_score = 1
    for val in scenic_arr 
       scenic_score *= val 
    end
    return scenic_score
end

# solves part1
function part1()
    global visible_trees = 0
    global x = 1
    global y = 1
    for line in lines 
        global x = 1
        #println(line)
        for ch in line
                if is_visible(x,y,xsize,ysize) == true
                    global visible_trees += 1
                end
            x+=1
        end
        global y+=1
    end 
    println(visible_trees)
end

#solves part2
function  part2()
global highest_scenic_score = 0
global y = 1
for line in lines 
    global x = 1
    #println(line)
    for ch in line
        t = highest_scenic_score
        if t < calculate_scenic_score(x,y,xsize,ysize)
            global highest_scenic_score  = calculate_scenic_score(x,y,xsize,ysize)
        end
        x+=1
    end
    global y+=1
end 
print(highest_scenic_score)    
end

lines =readlines("input.txt")
global ysize = count(i->(typeof(i) == String),(lines)) # linecount
global xsize = ysize # line length

# Strings are 1-indexed in julia ):
part1()
part2()