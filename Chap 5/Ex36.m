left_val = 0;
for i = 1:9
    left_val = left_val * 10 + i;
    result = left_val * 8 + i;
    fprintf('%d x 8 + %d = %d\n', left_val, i, result);
end