function element = pickone(x)
    vec_length = length(x);
    rand_idx = randi(vec_length);
    element = x(rand_idx);
    
end