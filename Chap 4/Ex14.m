function out = bai14eqfn(x)
if any(x == 0)
    out = -99;
else
    out = x.^2 + 1 ./ x;
end

end