function s = per2_24(x)
persistent total
if isempty(total)
    total = 0;
end
total = total + x;
s = total;

end