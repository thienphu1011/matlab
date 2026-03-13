function sumprint_24(row_vec)
    persistent running_sum;
 
    if isempty(running_sum)
        running_sum = 0;
    end
   
    running_sum = running_sum + sum(row_vec);
    
  
    fprintf('The sum is now %d\n', running_sum);
end