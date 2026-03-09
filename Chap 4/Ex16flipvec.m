function out = Ex16flipvec(x)
if isvector(x) && ~isscalar(x)
    out = flip(x);
else
    out = x;
end

end