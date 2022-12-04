
lines = Array.new
#count pairs where one range contains the other completely

count = 0

# could be much more clean
# first time writing in ruby though
def find_full_overlapping(str)
    range_arr = str.split(/,/, 2) # first split the two ranges 
    #work on the first range
    fst_range = range_arr[0] # contains the first range
    sec_range = range_arr[1] # contains the second range
    
    val_arr = fst_range.split(/-/,2) #split into the two values start and end
    val_arrtwo = sec_range.split(/-/,2) # split second range
    
    start1 = val_arr[0].to_i
    end1 = val_arr[1].to_i

    start2 = val_arrtwo[0].to_i
    end2 = val_arrtwo[1].to_i

    if  (start2 <= end1 && start2 >= start1 && end2 <= end1) == true || 
        (start1 <= end2 && start1 >= start2 && end1 <= end2) == true # check if any of the two ranges contain each other completely
        return 1
        puts("")
    end
        # if start2 < end and start2 >= start1 and end2 <= end
    #puts(val_arr[0]) 
end

File.readlines('input.txt').each do |line|
    if(find_full_overlapping(line) != nil)
    count += find_full_overlapping(line)
    end
end
puts(count)


