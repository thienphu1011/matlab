function countValue = func2()  
    persistent count;
    
    if isempty(count)
        count = 0;
    end
    
    count = count + 1;

    countValue = count;
end