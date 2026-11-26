function [y, H] = conv_tp(h, x)
h = h(:);
x = x(:);
Nx = length(x);
c = [h; zeros(Nx - 1, 1)];
r = [h(1), zeros(1, Nx - 1)];
H = toeplitz(c, r);
y = H * x;
end