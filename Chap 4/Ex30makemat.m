function M = Ex30makemat(v1, v2)
len1 = length(v1);
len2 = length(v2);
if len1 < len2
    v1 = [v1 zeros(1, len2 - len1)];
elseif len2 < len1
    v2 = [v2 zeros(1, len1 - len2)];
end

M = [v1; v2];

end