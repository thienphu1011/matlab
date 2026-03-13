
mat = [4, 2, 4, 3, 2;
       1, 3, 1, 0, 5;
       2, 4, 4, 0, 2];
[r, c] = size(mat);
for i = 1:r
    sumprint_24(mat(i, :))
end