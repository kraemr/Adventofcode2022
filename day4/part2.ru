lines = Array.new
count = 0


#this time check if any section overlaps 

def find_partial_overlap(str)
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

    if !(end1 < start2 || end2 < start1 )
        return 1
        puts("")
    end
end

File.readlines('input.txt').each do |line|
    if(find_partial_overlap(line) != nil)
    count += find_partial_overlap(line)
    end
end
puts(count)
