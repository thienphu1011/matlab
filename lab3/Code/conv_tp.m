function [y, H] = conv_tp(h, x)
h = h(:);
x = x(:);
Nh = length(h);
Nx = length(x);
Ny = Nh + Nx - 1;
H = zeros(Ny, Nx);
for j = 1:Nx
    H(j : j + Nh - 1, j) = h;
end
y = H * x;
end